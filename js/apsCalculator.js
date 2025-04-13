// apsCalculator.js - APS score calculation functionality
class APSCalculator {
    constructor() {
        this.apsPoints = {
            'A': 7,
            'B': 6,
            'C': 5,
            'D': 4,
            'E': 3,
            'F': 2,
            'G': 1
        };
        
        this.subjectLevels = {
            'Mathematics': 'high',
            'Physical Science': 'high',
            'Life Sciences': 'standard',
            'Accounting': 'standard',
            'Geography': 'standard',
            'History': 'standard',
            'English': 'standard',
            'Afrikaans': 'standard',
            'IsiZulu': 'standard',
            'Life Orientation': 'low'
        };
    }

    calculateAPS(results) {
        // Convert results to APS points
        const apsResults = results.map(result => {
            return {
                subject: result.subject,
                level: this.subjectLevels[result.subject] || 'standard',
                grade: result.grade,
                points: this.apsPoints[result.grade.toUpperCase()] || 0
            };
        });

        // Sort by points (descending)
        apsResults.sort((a, b) => b.points - a.points);

        // Calculate total APS (top 6 subjects excluding Life Orientation)
        const relevantSubjects = apsResults.filter(sub => sub.subject !== 'Life Orientation');
        const topSix = relevantSubjects.slice(0, 6);
        const totalAPS = topSix.reduce((sum, sub) => sum + sub.points, 0);

        return {
            totalAPS,
            subjectBreakdown: apsResults,
            meetsRequirements: (university, course) => this.checkCourseRequirements(totalAPS, university, course)
        };
    }

    checkCourseRequirements(apsScore, university, course) {
        // In a real app, this would check against actual requirements
        // For now, we'll use mock requirements
        const courseRequirements = {
            'University of Cape Town': {
                'Bachelor of Science': 42,
                'Bachelor of Commerce': 40
            },
            'University of Johannesburg': {
                'Bachelor of Science': 38,
                'Bachelor of Commerce': 35
            }
            // Add more universities and courses as needed
        };

        const requiredAPS = courseRequirements[university]?.[course] || 0;
        return apsScore >= requiredAPS;
    }
}

class SessionValidator {
    constructor() {
        this.sessionId = null; 
        this.expirationTime = null; 
        this.sessionDuration = 15 * 60 * 1000; // 15 minutes in milliseconds
    }

    // Generate a new v4 UUID (similar to your example)
    generateSessionId() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            const r = Math.random() * 16 | 0;
            const v = c === 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }

    // Initialize a new session
    startNewSession() {
        this.sessionId = this.generateSessionId();
        this.expirationTime = Date.now() + this.sessionDuration;
        this.updateUrlWithSessionId();
        return this.sessionId;
    }

    // Update URL with session ID (without page reload)
    updateUrlWithSessionId() {
        if (!this.sessionId) return;

        const url = new URL(window.location.href);
        url.searchParams.set('sessionId', this.sessionId);
        window.history.pushState({}, '', url.toString());
    }

    // Check if session is valid
    isSessionValid() {
        if (!this.sessionId || !this.expirationTime) {
            return false;
        }
        return Date.now() < this.expirationTime;
    }

    // Refresh the session (extend expiration time)
    refreshSession() {
        if (this.isSessionValid()) {
            this.expirationTime = Date.now() + this.sessionDuration;
            return true;
        }
        return false;
    }

    // Clear the current session
    clearSession() {
        this.sessionId = null;
        this.expirationTime = null;

        // Remove sessionId from URL
        const url = new URL(window.location.href);
        url.searchParams.delete('sessionId');
        window.history.pushState({}, '', url.toString());
    }

    // Get current session ID (if valid)
    getCurrentSessionId() {
        return this.isSessionValid() ? this.sessionId : null;
    }

    // Initialize from URL if session exists
    initializeFromUrl() {
        const url = new URL(window.location.href);
        const sessionIdFromUrl = url.searchParams.get('sessionId');

        if (sessionIdFromUrl) {
            // In a real implementation, you would validate this against your backend
            this.sessionId = sessionIdFromUrl;
            this.expirationTime = Date.now() + this.sessionDuration;
            return true;
        }
        return false;
    }

    // Auto-refresh session periodically
    startAutoRefresh(refreshInterval = 5 * 60 * 1000) { // Every 5 minutes
        this.refreshInterval = setInterval(() => {
            if (!this.refreshSession()) {
                this.clearSession();
                clearInterval(this.refreshInterval);
                // Optional: Redirect to login or show session expired message
                console.log('Session expired. Please log in again.');
            }
        }, refreshInterval);
    }

    // Stop auto-refresh
    stopAutoRefresh() {
        if (this.refreshInterval) {
            clearInterval(this.refreshInterval);
        }
    }
}


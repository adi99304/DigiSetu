// TutorialPage.jsx
import React from 'react';
import './TutorialPage.css';

const TutorialPage = () => {
    return (
        <div className="channel-container">
          {/* Header Section */}
          <header className="channel-header">
            <div className="channel-banner"></div>
            
            <div className="channel-info">
              <h1 className="channel-title">Channel Name</h1>
              <p className="subscribers-count">5.5M subscribers</p>
            </div>
    
            <nav className="channel-nav">
              <ul>
                <li className="active">HOME</li>
                <li>VIDEOS</li>
                <li>PLAYLISTS</li>
                <li>COMMUNITY</li>
                <li>CHANNELS</li>
                <li>ABOUT</li>
              </ul>
            </nav>
          </header>
    
          {/* Featured Video */}
          <section className="featured-video">
            <h2 className="featured-title">Featured Video Title here</h2>
            <p className="featured-description">
              A BRAND NEW segment of: Cat Gravity, Wheel Unfortunate & Top 10... another amazing 01
            </p>
            <p className="featured-description">
              Thanks to Crash Bandicoot for sponsoring this video! IT'S ABOUT TIME
            </p>
          </section>
    
          {/* Newest Videos */}
          <section className="video-section">
            <div className="section-header">
              <h2>Newest Channel Name Videos!</h2>
              <span className="playlist-link">Play all</span>
            </div>
            <div className="video-grid">
              {/* Repeat as needed */}
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
            </div>
          </section>
    
          {/* Most Popular Videos */}
          <section className="video-section">
            <h2>Most Popular Channel Name Videos</h2>
            <div className="video-grid">
              {/* Repeat as needed */}
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
              <div className="video-card">
                <div className="video-thumbnail"></div>
                <div className="video-info">
                  <h3 className="video-title">Video Title Here</h3>
                  <p className="video-meta">12M views • 1 week ago</p>
                </div>
              </div>
            </div>
          </section>
        </div>
      );
    };
    
    export default TutorialPage;
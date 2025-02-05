import React from "react";
import { FaGoogle, FaRegFileAlt, FaMobileAlt } from "react-icons/fa";
import "./LandingPage.css"; // Import CSS" />; // Import CSS

export default function LandingPage() {
  return (
    <div className="container">
      <div className="card">
        {/* Header */}
        <div className="header">
          <h1 className="title">
            Digi<span className="title-secondary">सेतु</span>
          </h1>
          <img
            src="https://via.placeholder.com/50"
            alt="Bridge Icon"
            className="icon"
          />
        </div>
        <p className="subtitle">Your Bridge to Digital Literacy</p>

        {/* Welcome Banner */}
        <div className="banner">
          <h2>Welcome to Digiसेतु <span className="waving-hand">👋</span></h2>
          <p>Learn. Practice. Master.</p>
        </div>

        {/* Buttons */}
        <div className="buttons">
          <button className="btn google">
            <FaGoogle className="icon-btn" /> Continue with Google
          </button>
          <button className="btn guest">🔹 Start as Guest</button>
          <p className="note">Join 10,000+ learners today</p>
        </div>

        {/* Courses */}
        <div className="courses">
          <div className="course-card">
            <FaMobileAlt className="course-icon" />
            <div>
              <h3>UPI Tutorials</h3>
              <p>20 min • Beginner</p>
            </div>
          </div>
          <div className="course-card">
            <FaRegFileAlt className="course-icon" />
            <div>
              <h3>Form Filling</h3>
              <p>30 min • Intermediate</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

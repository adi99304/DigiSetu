import React from "react";
import { useNavigate } from "react-router-dom";
import { FaGoogle, FaRegFileAlt, FaMobileAlt } from "react-icons/fa";
import "./LandingPage.css"; // Import CSS

export default function LandingPage() {
  const navigate = useNavigate();

  const handleStartAsGuest = () => {
    navigate('/home');
  };

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
          <button className="btn guest" onClick={handleStartAsGuest}>🔹 Start as Guest</button>
          <p className="note">Join 10,000+ learners today</p>
        </div>
      </div>
    </div>
  );
}
import React from 'react';
import { useNavigate } from 'react-router-dom';

const HomePage = () => {
    const navigate = useNavigate();

    const handleStart = () => {
        // Logic for starting the app can be added here
        console.log("Starting the app...");
    };

    return (
        <div className="home-page">
            <h1>Welcome to the Digital Literacy App</h1>
            <p>Explore various resources and tools to enhance your digital skills.</p>
            <button onClick={handleStart}>Get Started</button>
        </div>
    );
};

export default HomePage;
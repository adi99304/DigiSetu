import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { FaMobileAlt, FaRegFileAlt, FaLanguage } from 'react-icons/fa';
import { Carousel } from 'react-responsive-carousel';
import 'react-responsive-carousel/lib/styles/carousel.min.css';
import NavBar from '../components/NavBar';
import './HomePage.css';
// import carouselImage from '../assets/carousel-image.jpg'; // Import the image

const categories = [
  { name: "ChatGPT", learners: "4M+" },
  { name: "Data Science", learners: "7M+" },
  { name: "Python", learners: "47.7M+" },
  { name: "Machine Learning", learners: "8M+" },
  { name: "Deep Learning", learners: "2M+" },
  { name: "Artificial Intelligence (AI)", learners: "3M+" },
  { name: "Statistics", learners: "1M+" },
];

const courses = [
  {
    title: "ChatGPT Complete Guide: Learn Generative AI, ChatGPT & More",
    instructor: "Julian Melanson, Benza Maman",
    rating: 4.5,
    reviews: "43,931",
    price: "₹489",
    originalPrice: "₹2,699",
    bestseller: true,
    img: "https://via.placeholder.com/300", // Replace with actual image URL
  },
  {
    title: "The Complete AI-Powered Copywriting Course & ChatGPT",
    instructor: "Ing. Tomas Moravek",
    rating: 4.3,
    reviews: "1,738",
    price: "₹489",
    originalPrice: "₹3,099",
    img: "https://via.placeholder.com/300",
  },
  {
    title: "ChatGPT, Midjourney, Gemini, DeepSeek: Marketing Tools",
    instructor: "Anton Voroniuk",
    rating: 4.5,
    reviews: "470",
    price: "₹519",
    originalPrice: "₹799",
    img: "https://via.placeholder.com/300",
  },
  {
    title: "ChatGPT Masterclass: Navigating AI and Prompt Engineering",
    instructor: "Chetan Pujari",
    rating: 4.5,
    reviews: "290",
    price: "₹499",
    originalPrice: "₹799",
    img: "https://via.placeholder.com/300",
  },
];

const CourseCard = ({ course }) => (
  <div className="bg-white rounded-lg shadow-md p-4 w-72">
    <img src={course.img} alt={course.title} className="w-full h-40 rounded-md" />
    <h3 className="text-lg font-semibold mt-2">{course.title}</h3>
    <p className="text-gray-600 text-sm">{course.instructor}</p>
    <div className="flex items-center mt-2">
      <span className="text-yellow-500 text-sm font-bold">{course.rating} ★</span>
      <span className="text-gray-500 text-xs ml-1">({course.reviews})</span>
    </div>
    <div className="flex items-center mt-2">
      <span className="text-lg font-bold text-green-600">{course.price}</span>
      <span className="text-gray-400 text-sm line-through ml-2">{course.originalPrice}</span>
    </div>
    {course.bestseller && <span className="text-xs bg-yellow-300 px-2 py-1 rounded mt-2 inline-block">Bestseller</span>}
  </div>
);

const HomePage = () => {
    const navigate = useNavigate();
    const [searchQuery, setSearchQuery] = useState('');

    const handleStart = () => {
        // Logic for starting the app can be added here
        console.log("Starting the app...");
    };

    const handleSearch = (event) => {
        event.preventDefault();
        console.log("Search query:", searchQuery);
        // Add logic to handle the search query
    };

    const goToTutorialPage = () => {
        navigate('/tutorial');
    };

    return (
        <div className="home-page">
            <NavBar />
            <div className="search-bar">
                <form onSubmit={handleSearch}>
                    <input
                        type="text"
                        placeholder="Search..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                    />
                    <button type="submit">Search</button>
                </form>
            </div>
            <h1>Welcome to the Digital Literacy App</h1>
            <p>Explore various resources and tools to enhance your digital skills.</p>
            <button onClick={handleStart}>Get Started</button>

            {/* Carousel */}
            <div className="carousel-container">
                <Carousel showThumbs={false} autoPlay infiniteLoop>
                    <div>
                        <img src="https://via.placeholder.com/800x300" alt="Slide 1" />
                        <p className="legend">Slide 1</p>
                    </div>
                    <div>
                        <img src="https://via.placeholder.com/800x300" alt="Slide 2" />
                        <p className="legend">Slide 2</p>
                    </div>
                    <div>
                        <img src="https://via.placeholder.com/800x300" alt="Slide 3" />
                        <p className="legend">Slide 3</p>
                    </div>
                    {/* <div>
                        <img src={carouselImage} alt="Your Image" />
                        <p className="legend">Your Image</p>
                    </div> */}
                </Carousel>
            </div>

            {/* Categories */}
            <div className="categories">
                <h2>Categories</h2>
                <div className="category-cards">
                    {categories.map((cat, index) => (
                        <div key={index} className="category-card">
                            <h3>{cat.name}</h3>
                            <p>{cat.learners} learners</p>
                        </div>
                    ))}
                </div>
            </div>

            {/* Featured Courses */}
            <div className="courses">
                <h2>Featured Courses</h2>
                <div className="course-cards">
                    {courses.map((course, index) => (
                        <CourseCard key={index} course={course} />
                    ))}
                </div>
            </div>

            {/* Languages */}
            <div className="languages">
                <h2>Languages</h2>
                <div className="language-cards">
                    <div className="language-card">
                        <FaLanguage className="language-icon" />
                        <h3>English</h3>
                    </div>
                    <div className="language-card">
                        <FaLanguage className="language-icon" />
                        <h3>Hindi</h3>
                    </div>
                    <div className="language-card">
                        <FaLanguage className="language-icon" />
                        <h3>Spanish</h3>
                    </div>
                </div>
            </div>

            {/* Go to Tutorial Page Button */}
            <div className="tutorial-button-container">
                <button onClick={goToTutorialPage} className="tutorial-button">Go to Tutorial Page</button>
            </div>

            {/* Testimonials */}
            <div className="testimonials">
                <h2>What Our Users Say</h2>
                <div className="testimonial-card">
                    <p>"This app has helped me understand digital payments easily!"</p>
                    <p>- User A</p>
                </div>
                <div className="testimonial-card">
                    <p>"The tutorials are very informative and easy to follow."</p>
                    <p>- User B</p>
                </div>
            </div>

            {/* Footer */}
            <footer className="footer">
                <p>&copy; 2025 DigiSetu. All rights reserved.</p>
            </footer>
        </div>
    );
};

export default HomePage;

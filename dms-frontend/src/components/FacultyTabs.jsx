import {
  FiUser,
  FiBookOpen,
  FiBriefcase,
  FiLock
} from "react-icons/fi";
import "../styles/facultyTabs.css";

export default function FacultyTabs({ activeTab, setActiveTab }) {
  const tabIndex = {
    personal: 0,
    academic: 1,
    experience: 2,
    password: 3,
  }[activeTab];

  return (
    <div className="tabs-container">
      <div
        className="tabs-slider"
        style={{ transform: `translateX(${tabIndex * 100}%)` }}
      />

      <button
        className={activeTab === "personal" ? "tab active" : "tab"}
        onClick={() => setActiveTab("personal")}
      >
        <FiUser /> Personal Details
      </button>

      <button
        className={activeTab === "academic" ? "tab active" : "tab"}
        onClick={() => setActiveTab("academic")}
      >
        <FiBookOpen /> Academic Qualifications
      </button>

      <button
        className={activeTab === "experience" ? "tab active" : "tab"}
        onClick={() => setActiveTab("experience")}
      >
        <FiBriefcase /> Previous Experience
      </button>

      <button
        className={activeTab === "password" ? "tab active" : "tab"}
        onClick={() => setActiveTab("password")}
      >
        <FiLock /> Change Password
      </button>
    </div>
  );
}

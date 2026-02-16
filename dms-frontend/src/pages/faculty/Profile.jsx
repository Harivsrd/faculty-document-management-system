import { useState } from "react";
import FacultyTabs from "../../components/FacultyTabs";
import PersonalDetails from "./profileTabs/PersonalDetails";
import AcademicQualifications from "./profileTabs/AcademicQualifications";
import PreviousExperience from "./profileTabs/PreviousExperience";
import ChangePassword from "./profileTabs/ChangePassword";
import "../../styles/faculty.css";

export default function Profile() {
  const [activeTab, setActiveTab] = useState("personal");

  const renderTab = () => {
    switch (activeTab) {
      case "academic":
        return <AcademicQualifications />;
      case "experience":
        return <PreviousExperience />;
      case "password":
        return <ChangePassword />;
      default:
        return <PersonalDetails />;
    }
  };

  return (
    <div className="faculty-page" style={{
        minHeight: "94.6vh"
      }}>
      <h1>Faculty Profile</h1>
      <p className="subtitle">
        Manage your personal information and documents
      </p>

      <FacultyTabs activeTab={activeTab} setActiveTab={setActiveTab} />

      <div className="tab-content slide-animation">
        {renderTab()}
      </div>
    </div>
  );
}

import { Routes, Route, Navigate } from "react-router-dom";
import Navbar from "./components/Navbar";
import Login from "./pages/auth/Login";

import MyDocuments from "./pages/faculty/MyDocuments";
import Profile from "./pages/faculty/Profile";

import CreateFaculty from "./pages/admin/CreateFaculty";
import Dashboard from "./pages/admin/Dashboard";
import FacultyList from "./pages/admin/FacultyList";
import FacultyDossier from "./pages/admin/FacultyDossier";
import AllDocuments from "./pages/admin/AllDocuments";

import useAutoLogout from "./hooks/useAutoLogout";
import Footer from "./components/Footer";
import Register from "./pages/auth/Register";

function AppContent({ user, setUser }) {
  // ✅ SAFE: Router context exists
  useAutoLogout(user, setUser);

  // 🔒 NOT LOGGED IN
  if (!user) {
    return (
      <Routes>
        <Route path="/" element={<Login setUser={setUser} />} />
        <Route path="/register" element={<Register />} />
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
    );
  }

  return (
    <>
      <Navbar user={user} setUser={setUser} />

      <div className="app-content">
        <Routes>
          {/* FACULTY */}
          {user.role.toUpperCase() === "FACULTY" && (
            <>
              <Route path="/faculty/profile" element={<Profile />} />
              <Route path="/faculty/documents" element={<MyDocuments />} />
              <Route path="*" element={<Navigate to="/faculty/profile" />} />
            </>
          )}

          {/* ADMIN */}
          {user.role.toUpperCase() === "ADMIN" && (
            <>
              <Route path="/admin/dashboard" element={<Dashboard />} />
              <Route path="/admin/faculty" element={<FacultyList />} />
              <Route path="/admin/documents" element={<AllDocuments />} />
              <Route path="/admin/faculty/create" element={<CreateFaculty />} />
              <Route path="/admin/faculty/:id" element={<FacultyDossier />} />
              <Route path="*" element={<Navigate to="/admin/dashboard" />} />
            </>
          )}
        </Routes>
        
      </div>
      <Footer />
    </>
  );
}

export default AppContent;

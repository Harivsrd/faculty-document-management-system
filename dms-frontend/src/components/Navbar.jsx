import { Link, useLocation, useNavigate } from "react-router-dom";
import {
  FiFileText,
  FiUser,
  FiLogOut,
  FiGrid,
  FiUsers,
  FiMenu,
  FiX
} from "react-icons/fi";
import { useState } from "react";

function Navbar({ user, setUser }) {
  const location = useLocation();
  const navigate = useNavigate();
  const [open, setOpen] = useState(false);

  if (!user) return null;
  const role = user?.role;

  const isActive = (path) => location.pathname.startsWith(path);

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    setUser(null);
    navigate("/login");
  };

  return (
    <div className="navbar">
      {/* LEFT */}
      <div className="nav-left">
        <div className="logo">
          <img className="college_logo" src="/svec_logo.png" alt="SVEC" />
          <div className="logo-title">
            <div>Sri Vasavi Engineering College</div>
          </div>
        </div>

        {/* DESKTOP MENU */}
        <div className="nav-menu desktop">
          {role === "faculty" && (
            <>
              <NavItem to="/faculty/profile" icon={<FiUser />} label="Profile" active={isActive("/faculty/profile")} />
              <NavItem to="/faculty/documents" icon={<FiFileText />} label="My Documents" active={isActive("/faculty/documents")} />
            </>
          )}

          {role === "admin" && (
            <>
              <NavItem to="/admin/dashboard" icon={<FiGrid />} label="Dashboard" active={isActive("/admin/dashboard")} />
              <NavItem to="/admin/faculty" icon={<FiUsers />} label="Faculty" active={isActive("/admin/faculty")} />
              <NavItem to="/admin/documents" icon={<FiFileText />} label="Documents" active={isActive("/admin/documents")} />
            </>
          )}
        </div>
      </div>

      {/* RIGHT */}
      <div className="nav-right">
        <div className="user-info desktop">
          <div className="name">{user.name}</div>
          <div className="id">{user.faculty_id || "ADMIN"}</div>
        </div>

        <button className="btn btn-outline logout-btn desktop" onClick={handleLogout}>
          <FiLogOut size={16} /> Logout
        </button>

        {/* HAMBURGER */}
        <div className="hamburger" onClick={() => setOpen(!open)}>
          {open ? <FiX /> : <FiMenu />}
        </div>
      </div>

      {/* MOBILE MENU */}
      {open && (
        <div className="mobile-menu">
          {role === "faculty" && (
            <>
              <MobileItem to="/faculty/profile" label="Profile" onClick={() => setOpen(false)} />
              <MobileItem to="/faculty/documents" label="My Documents" onClick={() => setOpen(false)} />
            </>
          )}

          {role === "admin" && (
            <>
              <MobileItem to="/admin/dashboard" label="Dashboard" onClick={() => setOpen(false)} />
              <MobileItem to="/admin/faculty" label="Faculty" onClick={() => setOpen(false)} />
              <MobileItem to="/admin/documents" label="Documents" onClick={() => setOpen(false)} />
            </>
          )}

          <button className="mobile-logout" onClick={handleLogout}>
            <FiLogOut /> Logout
          </button>
        </div>
      )}
    </div>
  );
}

function NavItem({ to, icon, label, active }) {
  return (
    <Link to={to} className={`nav-item ${active ? "active" : ""}`}>
      <span className="nav-icon">{icon}</span>
      {label}
    </Link>
  );
}

function MobileItem({ to, label, onClick }) {
  return (
    <Link to={to} className="mobile-item" onClick={onClick}>
      {label}
    </Link>
  );
}

export default Navbar;

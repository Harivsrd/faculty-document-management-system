import { useState } from "react";
import { login, setAuthToken } from "../../api/auth";
import { useNavigate } from "react-router-dom";
import LoginNavbar from "./LoginNavbar";
import Footer from "../../components/Footer";
import "../../styles/admin.css";
import "../../styles/login.css";

function Login({ setUser }) {
  const navigate = useNavigate();

  const [facultyId, setFacultyId] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");

    try {
      setLoading(true);

      const res = await login({
        faculty_id: facultyId,
        password
      });

      localStorage.setItem("token", res.token);
      localStorage.setItem("user", JSON.stringify(res.user));

      setAuthToken(res.token);
      setUser(res.user);

      if (res.user.role === "admin") {
        navigate("/admin/dashboard");
      } else {
        navigate("/faculty/profile");
      }
    } catch (err) {
      setError(err.response?.data?.message || "Login failed");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="login-layout">
      <LoginNavbar />

      {/* BACKGROUND SECTION */}
      <div className="login-bg">
        <div className="login-overlay"></div>

        <form className="login-card" onSubmit={handleSubmit}>
          <h2>Sign In</h2>
          <p className="subtitle">
            Sri Vasavi Engineering College
          </p>

          {error && <p className="error">{error}</p>}

          <label>Faculty ID</label>
          <input
            type="text"
            placeholder="Enter your Faculty ID"
            value={facultyId}
            onChange={(e) => setFacultyId(e.target.value)}
            required
          />

          <label>Password</label>
          <input
            type="password"
            placeholder="Enter your password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />

          <p className="register-text">
            New faculty?{" "}
            <span onClick={() => navigate("/register")}>
              Register here
            </span>
          </p>

          <button className="login-btn" disabled={loading}>
            {loading ? "Signing in..." : "Login"}
          </button>
        </form>
      </div>

      <Footer />
    </div>
  );
}

// const inputStyle = {
//   width: "100%",
//   padding: "10px",
//   marginTop: "5px",
//   borderRadius: "6px",
//   border: "1px solid #d1d5db"
// }; 
export default Login;

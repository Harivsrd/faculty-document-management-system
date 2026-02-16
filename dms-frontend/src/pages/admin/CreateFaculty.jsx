import "../../styles/admin.css";
import { useState } from "react";
import api from "../../api/axios";
import { useNavigate } from "react-router-dom";

function CreateFaculty() {
  const navigate = useNavigate();

  const [form, setForm] = useState({
    name: "",
    faculty_id: "",
    email: "",
    password: "",
  });

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    setSuccess("");

    try {
      await api.post("/admin/faculty", form);
      setSuccess("Faculty created successfully");

      // Redirect after short delay
      setTimeout(() => {
        navigate("/admin/faculty");
      }, 1000);
    } catch (err) {
      setError(
        err.response?.data?.message || "Failed to create faculty"
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="admin-page">
      <div className="page-header">
        <h2>Create Faculty</h2>
        <p>Add a new faculty member to the system</p>
      </div>

      <div className="card" style={{ maxWidth: "500px" }}>
        <form onSubmit={handleSubmit}>
          <label>Name</label>
          <input
            name="name"
            value={form.name}
            onChange={handleChange}
            required
          />

          <label>Faculty ID</label>
          <input
            name="faculty_id"
            value={form.faculty_id}
            onChange={handleChange}
            required
          />

          <label>Email</label>
          <input
            name="email"
            type="email"
            value={form.email}
            onChange={handleChange}
          />

          <label>Password</label>
          <input
            name="password"
            type="password"
            value={form.password}
            onChange={handleChange}
            required
          />

          {error && <p style={{ color: "red" }}>{error}</p>}
          {success && <p style={{ color: "green" }}>{success}</p>}

          <button
            className="btn btn-primary"
            type="submit"
            disabled={loading}
            style={{ marginTop: "15px" }}
          >
            {loading ? "Creating..." : "Create Faculty"}
          </button>
        </form>
      </div>
    </div>
  );
}

export default CreateFaculty;

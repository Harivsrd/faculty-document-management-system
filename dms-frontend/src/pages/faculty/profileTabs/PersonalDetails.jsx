import { useEffect, useState } from "react";
import api from "../../../api/axios";
import { toast } from "react-toastify";

export default function PersonalDetails() {
  const [form, setForm] = useState({
    faculty_id: "",
    name: "",
    email: "",
    dob: "",
    gender: "",
    phone: "",
    department: ""
  });

  const [loading, setLoading] = useState(false);
  const [pageLoading, setPageLoading] = useState(true);

  // LOAD PROFILE
  useEffect(() => {
    const loadProfile = async () => {
      try {
        setPageLoading(true);
        const res = await api.get("/faculty/profile");
        const { faculty, profile } = res.data;

        setForm({
          faculty_id: faculty.faculty_id || "",
          name: faculty.name || "",
          email: faculty.email || "",
          dob: profile?.dob || "",
          gender: profile?.gender || "",
          phone: profile?.phone || "",
          department: profile?.department || ""
        });
      } catch {
        toast.error("Failed to load profile");
      } finally {
        setPageLoading(false);
      }
    };

    loadProfile();
  }, []);

  // HANDLE INPUT
  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  // SAVE PROFILE
  const saveProfile = async () => {
    try {
      setLoading(true);

      await api.put("/faculty/profile", {
        name: form.name,
        email: form.email,
        dob: form.dob,
        gender: form.gender,
        phone: form.phone,
        department: form.department
      });

      toast.success("Profile updated successfully");
    } catch {
      toast.error("Failed to update profile");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="card">
      <h3>Personal Information</h3>

      <div className="grid-2">

        {/* 🔹 SKELETON LOADING */}
        {pageLoading &&
          [...Array(6)].map((_, i) => (
            <div key={i}>
              <div className="skeleton-text" />
            </div>
          ))}

        {/* 🔹 FORM */}
        {!pageLoading && (
          <>
            <div>
              <label>Faculty ID</label>
              <input value={form.faculty_id} disabled />
            </div>

            <div>
              <label>Full Name</label>
              <input
                name="name"
                value={form.name}
                onChange={handleChange}
              />
            </div>

            <div>
              <label>Date of Birth</label>
              <input
                type="date"
                name="dob"
                value={form.dob}
                onChange={handleChange}
              />
            </div>

            <div>
              <label>Gender</label>
              <select
                name="gender"
                value={form.gender}
                onChange={handleChange}
              >
                <option value="">==Select==</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
              </select>
            </div>

            <div>
              <label>Email</label>
              <input
                name="email"
                value={form.email}
                onChange={handleChange}
              />
            </div>

            <div>
              <label>Phone</label>
              <input
                name="phone"
                value={form.phone}
                onChange={handleChange}
                placeholder="+91 XXXXX-XXXXX"
              />
            </div>

            <div>
              <label>Department</label>
              <select
                name="department"
                value={form.department}
                onChange={handleChange}
              >
                <option value="">==Select==</option>
                <option>Computer Science Engineering</option>
                <option>Artificial Intelligence and Machine Learning</option>
                <option>Electronics and Communication Engineering</option>
                <option>Electrical and Electronics Engineering</option>
                <option>Mechanical Engineering</option>
                <option>Civil Engineering</option>
              </select>
            </div>
          </>
        )}
      </div>

      {!pageLoading && (
        <button
          className="primary-btn"
          onClick={saveProfile}
          disabled={loading}
        >
          {loading ? "Saving..." : "Save Changes"}
        </button>
      )}
    </div>
  );
}

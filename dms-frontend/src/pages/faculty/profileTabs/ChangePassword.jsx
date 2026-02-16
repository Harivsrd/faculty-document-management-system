import { useState } from "react";
import api from "../../../api/axios";

export default function ChangePassword() {
  const [form, setForm] = useState({
    current_password: "",
    new_password: "",
    new_password_confirmation: ""
  });

  const [loading, setLoading] = useState(false);

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const updatePassword = async () => {
    if (form.new_password !== form.new_password_confirmation) {
      alert("New password and confirmation do not match");
      return;
    }

    try {
      setLoading(true);

      await api.post("/faculty/change-password", form);

      alert("Password updated successfully");

      // clear fields
      setForm({
        current_password: "",
        new_password: "",
        new_password_confirmation: ""
      });

    } catch (err) {
      alert(err.response?.data?.message || "Password update failed");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="card"  >
      <h3>Change Password</h3>

      <div className="grid-2">
        <input
          type="password"
          name="current_password"
          placeholder="Current Password"
          value={form.current_password}
          onChange={handleChange}
        />

        <input
          type="password"
          name="new_password"
          placeholder="New Password"
          value={form.new_password}
          onChange={handleChange}
        />

        <input
          type="password"
          name="new_password_confirmation"
          placeholder="Confirm New Password"
          value={form.new_password_confirmation}
          onChange={handleChange}
        />
      </div>

      <button
        className="primary-btn"
        onClick={updatePassword}
        disabled={loading}
      >
        {loading ? "Updating..." : "Update Password"}
      </button>
    </div>
  );
}

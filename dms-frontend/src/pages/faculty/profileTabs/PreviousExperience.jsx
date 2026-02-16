import { useEffect, useState } from "react";
import api from "../../../api/axios";
import { FiEye, FiDownload, FiTrash2 } from "react-icons/fi";
import { toast } from "react-toastify";

export default function PreviousExperience() {
  const [list, setList] = useState([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  const [form, setForm] = useState({
    college_name: "",
    designation: "",
    from_year: "",
    to_year: "",
    certificate: null,
  });

  /* ================= LOAD DATA ================= */
  useEffect(() => {
    loadExperience();
  }, []);

  const loadExperience = async () => {
    try {
      setLoading(true);
      const res = await api.get("/faculty/experience");
      setList(res.data || []);
    } catch {
      toast.error("Failed to load experience");
    } finally {
      setLoading(false);
    }
  };

  /* ================= HANDLE FORM ================= */
  const handleChange = (e) => {
    const { name, value, files } = e.target;
    setForm({
      ...form,
      [name]: files ? files[0] : value,
    });
  };

  /* ================= ADD EXPERIENCE ================= */
  const addExperience = async () => {
    if (!form.college_name || !form.designation || !form.from_year) {
      toast.warning("Please fill required fields");
      return;
    }

    try {
      setSaving(true);
      const fd = new FormData();
      Object.keys(form).forEach((key) => {
        if (form[key]) fd.append(key, form[key]);
      });

      await api.post("/faculty/experience", fd);
      toast.success("Experience added successfully");

      setForm({
        college_name: "",
        designation: "",
        from_year: "",
        to_year: "",
        certificate: null,
      });

      loadExperience();
    } catch {
      toast.error("Failed to add experience");
    } finally {
      setSaving(false);
    }
  };

  /* ================= DELETE ================= */
  const deleteExperience = async (id) => {
    if (!window.confirm("Delete this experience?")) return;

    try {
      await api.delete(`/faculty/experience/${id}`);
      toast.success("Experience deleted");
      loadExperience();
    } catch {
      toast.error("Failed to delete experience");
    }
  };

  return (
    <div className="card">
      <div className="card-body">
        <h3>Previous Experience</h3>
        <p className="subtitle">Add and manage your work experience</p>

        {/* ================= ADD NEW EXPERIENCE ================= */}
        <div className="sub-card">
          <h4>Add New Experience</h4>

          <div className="grid-3">
            <div>
              <label>College / Institution</label>
              <input
                name="college_name"
                value={form.college_name}
                onChange={handleChange}
                placeholder="Enter college name"
              />
            </div>

            <div>
              <label>Designation</label>
              <input
                name="designation"
                value={form.designation}
                onChange={handleChange}
                placeholder="Assistant Professor"
              />
            </div>

            <div>
              <label>From Year</label>
              <input
                name="from_year"
                value={form.from_year}
                onChange={handleChange}
                placeholder="2018"
              />
            </div>

            <div>
              <label>To Year</label>
              <input
                name="to_year"
                value={form.to_year}
                onChange={handleChange}
                placeholder="2022 / Leave empty if current"
              />
            </div>

            <div className="grid-span-3">
              <label>Experience Certificate (optional)</label>
              <input
                type="file"
                name="certificate"
                onChange={handleChange}
              />
            </div>
          </div>

          <button
            className="success-btn"
            onClick={addExperience}
            disabled={saving}
          >
            {saving ? "Saving..." : "+ Add Experience"}
          </button>
        </div>

        {/* ================= TABLE ================= */}
        <h4 className="section-title">Work Experience</h4>

        <table className="data-table">
          <thead>
            <tr>
              <th>College / Institution</th>
              <th>Designation</th>
              <th>Duration</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tbody>
            {/* ⏳ Skeleton Loader */}
            {loading &&
              [...Array(3)].map((_, i) => (
                <tr key={i}>
                  <td colSpan="4">
                    <div className="skeleton-row"></div>
                  </td>
                </tr>
              ))}

            {!loading &&
              list.map((exp) => (
                <tr key={exp.id}>
                  <td>{exp.college_name}</td>
                  <td>{exp.designation}</td>
                  <td>
                    {exp.from_year} – {exp.to_year || "Present"}
                  </td>
                  <td className="actions">
                    {exp.experience_certificate && (
                      <>
                        <a
                          href={`http://127.0.0.1:8000/storage/${exp.experience_certificate}`}
                          target="_blank"
                          rel="noreferrer"
                        >
                          <FiEye title="View" />
                        </a>

                        <a
                          href={`http://127.0.0.1:8000/storage/${exp.experience_certificate}`}
                          download
                        >
                          <FiDownload title="Download" />
                        </a>
                      </>
                    )}

                    <FiTrash2
                      title="Delete"
                      onClick={() => deleteExperience(exp.id)}
                    />
                  </td>
                </tr>
              ))}

            {!loading && list.length === 0 && (
              <tr>
                <td colSpan="4" align="center">
                  No experience added
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}

import { FiEye, FiDownload, FiTrash2 } from "react-icons/fi";
import { useEffect, useState } from "react";
import api from "../../../api/axios";
import toast from "react-hot-toast";

export default function AcademicQualifications() {
  const [list, setList] = useState([]);
  const [loading, setLoading] = useState(false);
  const [listLoading, setListLoading] = useState(true);


  const [form, setForm] = useState({
    degree: "",
    university: "",
    from_year: "",
    to_year: "",
    certificate_type: "",
    certificate: null
  });

  /* ========================
     LOAD DATA
  ======================== */
  const loadQualifications = async () => {
  try {
    setListLoading(true);
    const res = await api.get("/faculty/qualifications");
    setList(res.data || []);
  } catch {
    toast.error("Failed to load qualifications");
  } finally {
    setListLoading(false);
  }
};


  useEffect(() => {
    loadQualifications();
  }, []);

  /* ========================
     HANDLE INPUT CHANGE
  ======================== */
  const handleChange = (e) => {
    const { name, value, files } = e.target;
    setForm({
      ...form,
      [name]: files ? files[0] : value
    });
  };

  /* ========================
     ADD QUALIFICATION
  ======================== */
  const addQualification = async () => {
    if (!form.degree || !form.university || !form.from_year || !form.certificate) {
      toast.error("Please fill all required fields");
      return;
    }

    const fd = new FormData();
    Object.entries(form).forEach(([key, value]) => {
      if (value) fd.append(key, value);
    });

    try {
      setLoading(true);
      await api.post("/faculty/qualifications", fd);
      toast.success("Qualification added successfully");

      setForm({
        degree: "",
        university: "",
        from_year: "",
        to_year: "",
        certificate_type: "",
        certificate: null
      });

      loadQualifications();
    } catch {
      toast.error("Failed to add qualification");
    } finally {
      setLoading(false);
    }
  };

  /* ========================
     DELETE QUALIFICATION
  ======================== */
  const deleteQualification = async (id) => {
    if (!window.confirm("Are you sure you want to delete this qualification?")) return;

    try {
      await api.delete(`/faculty/qualifications/${id}`);
      toast.success("Qualification deleted");
      loadQualifications();
    } catch {
      toast.error("Failed to delete qualification");
    }
  };

  return (
    <div className="card">
      <div className="card-body">
        <h3>Academic Qualifications</h3>
        <p className="subtitle">Add and manage your educational certificates</p>

        {/* ========================
            ADD NEW QUALIFICATION
        ======================== */}
        <div className="sub-card">
          <h4>Add New Qualification</h4>

          <div className="grid-3">
            <div>
              <label>Qualification</label>
              <select name="degree" value={form.degree} onChange={handleChange}>
                <option value="">Select...</option>
                <option>SSC</option>
                <option>Inter</option>
                <option>UG</option>
                <option>PG</option>
                <option>PhD</option>
              </select>
            </div>

            <div>
              <label>University / Board</label>
              <input
                name="university"
                value={form.university}
                onChange={handleChange}
                placeholder="University name"
              />
            </div>

            <div>
              <label>From Year</label>
              <input
                name="from_year"
                value={form.from_year}
                onChange={handleChange}
                placeholder="2010"
              />
            </div>

            <div>
              <label>To Year</label>
              <input
                name="to_year"
                value={form.to_year}
                onChange={handleChange}
                placeholder="2014"
              />
            </div>

            <div>
              <label>Certificate Type</label>
              <select
                name="certificate_type"
                value={form.certificate_type}
                onChange={handleChange}
              >
                <option value="">Select...</option>
                <option>Degree</option>
                <option>Marks Memo</option>
              </select>
            </div>

            {/* ✅ FIXED FILE INPUT */}
            <div>
              <label>Upload Certificate</label>

              <div className="file-upload">
                <input
                  type="file"
                  name="certificate"
                  onChange={handleChange}
                />
              </div>
            </div>
          </div>

          <button
            className="success-btn"
            onClick={addQualification}
            disabled={loading}
          >
            {loading ? "Saving..." : "+ Add Qualification"}
          </button>
        </div>

        {/* ========================
            UPLOADED QUALIFICATIONS
        ======================== */}
        <h4 className="section-title">Uploaded Qualifications</h4>

        <table className="data-table">
          <thead>
            <tr>
              <th>Qualification</th>
              <th>University</th>
              <th>Duration</th>
              <th>Certificate</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tbody>
            {/* 🔹 SKELETON LOADING */}
            {listLoading &&
              [...Array(4)].map((_, i) => (
                <tr key={i}>
                  <td><div className="skeleton-text" /></td>
                  <td><div className="skeleton-text" /></td>
                  <td><div className="skeleton-text" /></td>
                  <td><div className="skeleton-badge" /></td>
                  <td>
                    <div className="skeleton-icon" />
                  </td>
                </tr>
              ))}

            {/* 🔹 REAL DATA */}
            {!listLoading &&
              list.map(q => (
                <tr key={q.id}>
                  <td>{q.degree}</td>
                  <td>{q.university}</td>
                  <td>{q.from_year} - {q.to_year || "Present"}</td>
                  <td>{q.certificate_type}</td>
                  <td className="actions">
                    {q.certificate_path && (
                      <>
                        <a
                          href={`http://127.0.0.1:8000/storage/${q.certificate_path}`}
                          target="_blank"
                          rel="noreferrer"
                        >
                          <FiEye />
                        </a>
                        <a
                          href={`http://127.0.0.1:8000/storage/${q.certificate_path}`}
                          download
                        >
                          <FiDownload />
                        </a>
                      </>
                    )}
                    <FiTrash2 onClick={() => deleteQualification(q.id)} />
                  </td>
                </tr>
              ))}

            {/* 🔹 EMPTY STATE */}
            {!listLoading && list.length === 0 && (
              <tr>
                <td colSpan="5" style={{ textAlign: "center" }}>
                  No qualifications added
                </td>
              </tr>
            )}
          </tbody>

        </table>
      </div>
    </div>
  );
}

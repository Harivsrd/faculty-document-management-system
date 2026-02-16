import "../../styles/admin.css";
import { FiEye, FiSearch } from "react-icons/fi";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { getFacultyList } from "../../api/admin";

function FacultyList() {
  const navigate = useNavigate();

  const [faculty, setFaculty] = useState([]);
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const loadFaculty = async () => {
      try {
        const data = await getFacultyList();
        setFaculty(data);
      } catch {
        setError("Failed to load faculty list");
      } finally {
        setLoading(false);
      }
    };

    loadFaculty();
  }, []);

  const filteredFaculty = faculty.filter((f) =>
    `${f.faculty_id} ${f.name} ${f.department || ""}`
      .toLowerCase()
      .includes(search.toLowerCase())
  );

  return (
    <div className="admin-page" style={{
        minHeight: "94.6vh"
      }}>
      {/* PAGE HEADER */}
      <div className="page-header">
        <h2>Faculty List</h2>
        <p>View faculty profiles and access their dossiers</p>

        <button
          className="create-faculty"
          onClick={() => navigate("/admin/faculty/create")}
        >
          + Create Faculty
        </button>
      </div>

      {/* MAIN CARD */}
      <div className="card">
        <div className="card-header">
          <h3>All Faculty Members</h3>
          <p className="muted">
            Click on “View Dossier” to see complete faculty profile and documents
          </p>
        </div>

        {/* SEARCH BAR */}
        <div className="search-row">
          <FiSearch />
          <input
            placeholder="Search by Faculty ID, Name or Department..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </div>

        {/* ERROR */}
        {error && <p style={{ color: "red" }}>{error}</p>}

        {/* TABLE */}
        <table className="table">
          <thead>
            <tr>
              <th>Faculty ID</th>
              <th>Name</th>
              <th>Department</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tbody>
            {/* 🔹 Skeleton Loader */}
            {loading &&
              [...Array(6)].map((_, i) => (
                <tr key={i}>
                  <td colSpan="7">
                    <div className="skeleton-row"></div>
                  </td>
                </tr>
              ))}

            {/* 🔹 Data Rows */}
            {!loading &&
              filteredFaculty.map((f) => (
                <tr key={f.id}>
                  <td>{f.faculty_id}</td>
                  <td>{f.name}</td>
                  <td>{f.department || "-"}</td>
                  <td>{f.email}</td>
                  <td>{f.phone || "-"}</td>
                  <td>
                    <span className="badge badge-active">
                      {f.status || "Active"}
                    </span>
                  </td>
                  <td className="actions">
                    <button
                      className="btn-outline"
                      onClick={() => navigate(`/admin/faculty/${f.id}`)}
                    >
                      <FiEye /> View Dossier
                    </button>
                  </td>
                </tr>
              ))}

            {!loading && filteredFaculty.length === 0 && (
              <tr>
                <td colSpan="7" style={{ textAlign: "center" }}>
                  No faculty found
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default FacultyList;

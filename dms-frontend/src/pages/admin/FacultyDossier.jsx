import "../../styles/dossier.css";
import {
  FiBookOpen,
  FiBriefcase,
  FiEye,
  FiDownload, FiCheckCircle, FiXCircle
} from "react-icons/fi";

import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import api from "../../api/axios";

function FacultyDossier() {
  const { id } = useParams();

  const [faculty, setFaculty] = useState(null);
  const [profile, setProfile] = useState({});
  const [academic, setAcademic] = useState([]);
  const [experience, setExperience] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const approveDoc = async (doc) => {
    await api.post("/admin/documents/approve", {
      id: doc.id,
      type: "academic"
    });
    reloadDossier();
  };

  const rejectDoc = async (doc) => {
    await api.post("/admin/documents/reject", {
      id: doc.id,
      type: "academic"
    });
    reloadDossier();
  };

  const reloadDossier = async () => {
    const res = await api.get(`/admin/faculty/${id}`);
    setAcademic(res.data.academic || []);
    setExperience(res.data.experience || []);
  };


  useEffect(() => {
    const loadDossier = async () => {
      try {
        const res = await api.get(`/admin/faculty/${id}`);
        setFaculty(res.data.faculty);
        setAcademic(res.data.academic || []);
        setExperience(res.data.experience || []);
        setProfile(res.data.profile || {});
      } catch {
        setError("Failed to load faculty dossier");
      } finally {
        setLoading(false);
      }
    };

    loadDossier();
  }, [id]);

  if (error) return <p style={{ color: "red" }}>{error}</p>;

  return (
    <div className="dossier-container">

      {/* HEADER */}
      <div className="dossier-header">
        {loading ? (
          <div className="skeleton-header"></div>
        ) : (
          <>
            <div>
              <h2>{faculty.name}</h2>
              <p>{faculty.faculty_id} • {profile.department || "-"}</p>
            </div>
            <button className="dossier-btn">Faculty Dossier</button>
          </>
        )}
      </div>

      {/* BASIC INFO */}
      <div className="card info-grid">
        {loading ? (
          [...Array(5)].map((_, i) => (
            <div key={i} className="skeleton-line"></div>
          ))
        ) : (
          <>
            <Info label="Email" value={faculty.email} />
            <Info label="Phone" value={profile.phone} />
            <Info label="Date of Birth" value={profile.dob} />
            <Info label="Department" value={profile.department} />
            <Info label="Joining Date" value={profile.joining_date} />
          </>
        )}
      </div>

      {/* ACADEMIC */}
      <div className="card">
        <h3><FiBookOpen /> Academic Qualifications</h3>
        <p className="subtitle">Educational certificates and credentials</p>

        <table className="table">
          <thead>
            <tr>
              <th>Title</th>
              <th>University</th>
              <th>Duration</th>
              <th>Category</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tbody>
            {loading &&
              [...Array(4)].map((_, i) => (
                <tr key={i}>
                  <td colSpan="6">
                    <div className="skeleton-row"></div>
                  </td>
                </tr>
              ))}

            {!loading &&
              academic.map((doc) => (
                <tr key={doc.id}>
                  <td>{doc.degree}</td>
                  <td>{doc.university}</td>
                  <td>{doc.from_year} - {doc.to_year}</td>
                  <td>{doc.certificate_type}</td>
                  <td>
                    <span className={`badge badge-${(doc.status || "pending").toLowerCase()}`}>
                      {doc.status || "Pending"}
                    </span>
                  </td>
                  <td className="actions">
                    <a
                      href={`http://127.0.0.1:8000/storage/${doc.certificate_path}`}
                      target="_blank"
                      rel="noreferrer"
                      title="View"
                    >
                      <FiEye />
                    </a>

                    <a
                      href={`http://127.0.0.1:8000/storage/${doc.certificate_path}`}
                      download
                      title="Download"
                    >
                      <FiDownload />
                    </a>

                    {(
                      <>
                        <FiCheckCircle
                          className="approve-icon"
                          title="Approve"
                          onClick={() => approveDoc(doc)}
                        />

                        <FiXCircle
                          className="reject-icon"
                          title="Reject"
                          onClick={() => rejectDoc(doc)}
                        />
                      </>
                    )}
                  </td>

                </tr>
              ))}

            {!loading && academic.length === 0 && (
              <tr>
                <td colSpan="6" style={{ textAlign: "center" }}>
                  No academic documents uploaded
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {/* EXPERIENCE */}
      <div className="card">
        <h3><FiBriefcase /> Previous Experience</h3>
        <p className="subtitle">Work history and experience certificates</p>

        <table className="table">
          <thead>
            <tr>
              <th>Institution</th>
              <th>Designation</th>
              <th>Duration</th>
              <th>Certificate</th>
            </tr>
          </thead>

          <tbody>
            {loading &&
              [...Array(3)].map((_, i) => (
                <tr key={i}>
                  <td colSpan="4">
                    <div className="skeleton-row"></div>
                  </td>
                </tr>
              ))}

            {!loading &&
              experience.map((exp) => (
                <tr key={exp.id}>
                  <td>{exp.college_name}</td>
                  <td>{exp.designation}</td>
                  <td>{exp.from_year} – {exp.to_year || "Present"}</td>
                  <td className="actions">
                    {exp.experience_certificate && (
                      <>
                        <a
                          href={`http://127.0.0.1:8000/storage/${exp.experience_certificate}`}
                          target="_blank"
                          rel="noreferrer"
                        >
                          <FiDownload />
                        </a>

                        {(exp.status === "Pending" || !exp.status) && (
                          <>
                            <FiCheckCircle
                              className="approve-icon"
                              onClick={() =>
                                api.post("/admin/documents/approve", {
                                  id: exp.id,
                                  type: "experience"
                                }).then(reloadDossier)
                              }
                            />

                            <FiXCircle
                              className="reject-icon"
                              onClick={() =>
                                api.post("/admin/documents/reject", {
                                  id: exp.id,
                                  type: "experience"
                                }).then(reloadDossier)
                              }
                            />
                          </>
                        )}
                      </>
                    )}
                  </td>

                </tr>
              ))}

            {!loading && experience.length === 0 && (
              <tr>
                <td colSpan="4" style={{ textAlign: "center" }}>
                  No experience added
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      <div className="note-box">
        <b>Note:</b> All certificates can be viewed and downloaded for verification.
      </div>

    </div>
  );
}

const Info = ({ label, value }) => (
  <div>
    <label>{label}</label>
    <p>{value || "-"}</p>
  </div>
);

export default FacultyDossier;

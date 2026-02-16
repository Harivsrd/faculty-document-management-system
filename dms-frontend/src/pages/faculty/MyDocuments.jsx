import "../../styles/faculty.css";
import { FiEye, FiDownload } from "react-icons/fi";
import { useEffect, useState } from "react";
import api from "../../api/axios";

export default function MyDocuments() {
  const [documents, setDocuments] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    loadDocuments();
  }, []);

  const loadDocuments = async () => {
    try {
      const res = await api.get("/faculty/documents");
      setDocuments(res.data || []);
    } catch {
      setError("Failed to load documents");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="faculty-page" style={{ minHeight: "94.6vh" }}>
      <h1>My Documents</h1>
      <p className="subtitle">View and download your uploaded documents</p>

      <div className="card">
        <h3>Uploaded Documents</h3>
        <p className="subtitle">
          Documents uploaded through the Profile section
        </p>

        <table className="data-table">
          <thead>
            <tr>
              <th>Document Name</th>
              <th>Category</th>
              <th>Uploaded Date</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tbody>
            {/* 🔹 SKELETON LOADER */}
            {loading &&
              [...Array(5)].map((_, i) => (
                <tr key={i}>
                  <td><div className="skeleton-text"></div></td>
                  <td><div className="skeleton-text"></div></td>
                  <td><div className="skeleton-text"></div></td>
                  <td><div className="skeleton-badge"></div></td>
                  <td>
                    <div className="skeleton-icon"></div>
                  </td>
                </tr>
              ))}

            {/* 🔹 ERROR */}
            {!loading && error && (
              <tr>
                <td colSpan="5" style={{ textAlign: "center", color: "red" }}>
                  {error}
                </td>
              </tr>
            )}

            {/* 🔹 DATA */}
            {!loading && !error &&
              documents.map((doc,index) => (
                <tr key={`${doc.id}-${index}`}>
                  <td>{doc.title}</td>
                  <td>{doc.category}</td>
                  <td>{new Date(doc.created_at).toLocaleDateString()}</td>

                  <td>
                    <span className={`badge badge-${doc.status.toLowerCase()}`}>
                      {doc.status}
                    </span>
                  </td>

                  <td className="actions">
                    <a
                      href={`http://127.0.0.1:8000/storage/${doc.file_path}`}
                      target="_blank"
                      rel="noreferrer"
                      title="View"
                    >
                      <FiEye />
                    </a>

                    <a
                      href={`http://127.0.0.1:8000/storage/${doc.file_path}`}
                      download
                      title="Download"
                    >
                      <FiDownload />
                    </a>
                  </td>
                </tr>
              ))}

            {/* 🔹 EMPTY STATE */}
            {!loading && !error && documents.length === 0 && (
              <tr>
                <td colSpan="5" style={{ textAlign: "center" }}>
                  No documents uploaded
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      <div className="note">
        <b>Note:</b> To upload or update documents, go to the
        <b> Faculty Profile </b> section.
      </div>
    </div>
  );
}

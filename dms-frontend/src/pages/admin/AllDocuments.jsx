import "../../styles/adminDocuments.css";
import { useEffect, useState } from "react";
import { getAllDocuments } from "../../api/admin";
import {
  FiEye,
  FiSearch,
  FiXCircle,
  FiCheckCircle
} from "react-icons/fi";
import api from "../../api/axios";

function AllDocuments() {
  const [docs, setDocs] = useState([]);
  const [page, setPage] = useState(1);
  const [meta, setMeta] = useState({});
  const [loading, setLoading] = useState(true);

  const [filters, setFilters] = useState({
    search: "",
    status: ""
  });

  const loadDocuments = async (p = 1) => {
    setLoading(true);
    const res = await getAllDocuments({
      page: p,
      per_page: 10,
      ...filters
    });

    setDocs(res.data);
    setMeta(res);
    setPage(p);
    setLoading(false);
  };

  useEffect(() => {
    loadDocuments();
  }, []);

  const approve = async (doc) => {
    await api.post("/admin/documents/approve", doc);
    loadDocuments(page);
  };

  const reject = async (doc) => {
    await api.post("/admin/documents/reject", doc);
    loadDocuments(page);
  };

  return (
    <div className="admin-page admin-documents" style={{
        minHeight: "94.6vh"
      }}>

      <div className="page-header">
        <h2>All Documents</h2>
        <p>Search, filter and approve documents</p>
      </div>

      <div className="card">

        {/* FILTERS */}
        <div className="document-filters">
          <div className="search-box">
            <FiSearch />
            <input
              placeholder="Faculty ID or Name"
              onChange={e =>
                setFilters({ ...filters, search: e.target.value })
              }
            />
          </div>

          <select
            onChange={e =>
              setFilters({ ...filters, status: e.target.value })
            }
          >
            <option value="">All Status</option>
            <option>Pending</option>
            <option>Approved</option>
            <option>Rejected</option>
          </select>

          <button
            className="btn-primary apply-btn"
            onClick={() => loadDocuments(1)}
          >
            Apply Filters
          </button>
        </div>

        {/* TABLE */}
        <table>
          <thead>
            <tr>
              <th>Faculty</th>
              <th>Document</th>
              <th>Category</th>
              <th>Date</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tbody>
            {/* 🔹 Skeleton Loader */}
            {loading &&
              [...Array(8)].map((_, i) => (
                <tr key={i}>
                  <td colSpan="6">
                    <div className="skeleton-row"></div>
                  </td>
                </tr>
              ))}

            {/* 🔹 Data */}
            {!loading &&
              docs.map(d => (
                <tr key={`${d.type}-${d.id}`}>
                  <td>{d.faculty_id} – {d.faculty_name}</td>
                  <td>{d.document}</td>
                  <td>{d.category}</td>
                  <td>{new Date(d.created_at).toLocaleDateString()}</td>
                  <td>
                    <span className={`badge badge-${d.status.toLowerCase()}`}>
                      {d.status}
                    </span>
                  </td>
                  <td className="actions">
                    <a
                      href={`http://127.0.0.1:8000/storage/${d.file_path}`}
                      target="_blank"
                      rel="noreferrer"
                    >
                      <FiEye />
                    </a>

                    {d.status === "Pending" && (
                      <>
                        <FiCheckCircle
                          className="approve-icon"
                          onClick={() => approve(d)}
                        />
                        <FiXCircle
                          className="reject-icon"
                          onClick={() => reject(d)}
                        />
                      </>
                    )}
                  </td>
                </tr>
              ))}

            {!loading && docs.length === 0 && (
              <tr>
                <td colSpan="6" style={{ textAlign: "center" }}>
                  No documents found
                </td>
              </tr>
            )}
          </tbody>
        </table>

        {/* PAGINATION */}
        <div className="pagination">
          <button
            className="page-btn"
            disabled={page === 1}
            onClick={() => loadDocuments(page - 1)}
          >
            ← Prev
          </button>

          <span className="page-info">
            Page <b>{page}</b> of <b>{meta.last_page}</b>
          </span>

          <button
            className="page-btn"
            disabled={page === meta.last_page}
            onClick={() => loadDocuments(page + 1)}
          >
            Next →
          </button>
        </div>

      </div>
    </div>
  );
}

export default AllDocuments;

import "../../styles/adminDashboard.css";
import {
  FiUsers,
  FiFileText,
  FiClock,
  FiCheckCircle,
  FiXCircle
} from "react-icons/fi";
import { useEffect, useState } from "react";
import api from "../../api/axios";

function Dashboard() {
  const [stats, setStats] = useState(null);
  const [error, setError] = useState("");

  useEffect(() => {
    let mounted = true;

    api.get("/admin/dashboard-stats")
      .then(res => {
        if (mounted) setStats(res.data);
      })
      .catch(() => {
        if (mounted) setError("Failed to load dashboard data");
      });

    return () => {
      mounted = false;
    };
  }, []);

  /* ❌ ERROR STATE */
  if (error) {
    return (
      <div className="admin-page">
        <div className="admin-dashboard">
          <div className="page-header">
            <h2>Admin Dashboard</h2>
          </div>
          <p className="error-text">{error}</p>
        </div>
      </div>
    );
  }

  /* ⏳ SKELETON LOADER */
  if (!stats) {
    return (
      <div className="admin-page">
        <div className="admin-dashboard">

          <div className="page-header">
            <h2>Admin Dashboard</h2>
            <p>Overview of faculty documents and approvals</p>
          </div>

          <div className="stats-grid">
            {[...Array(5)].map((_, i) => (
              <SkeletonStatCard key={i} />
            ))}
          </div>

        </div>
      </div>
    );
  }

  /* ✅ REAL DATA */
  return (
    <div className="admin-page" >
      <div className="admin-dashboard">

        <div className="page-header">
          <h2>Admin Dashboard</h2>
          <p>Overview of faculty documents and approvals</p>
        </div>

        <div className="stats-grid">
          <StatCard
            title="Total Faculty"
            value={stats.totalFaculty}
            subtitle="Active faculty members"
            icon={<FiUsers />}
            color="blue"
          />
          <StatCard
            title="Total Documents"
            value={stats.totalDocuments}
            subtitle="Documents in system"
            icon={<FiFileText />}
            color="purple"
          />
          <StatCard
            title="Pending Documents"
            value={stats.pendingDocuments}
            subtitle="Awaiting approval"
            icon={<FiClock />}
            color="yellow"
          />
          <StatCard
            title="Approved Documents"
            value={stats.approvedDocuments}
            subtitle="Verified documents"
            icon={<FiCheckCircle />}
            color="green"
          />
          <StatCard
            title="Rejected Documents"
            value={stats.rejectedDocuments}
            subtitle="Documents rejected"
            icon={<FiXCircle />}
            color="red"
          />
        </div>

      </div>
    </div>
  );
}

/* =========================
   STAT CARD
========================= */
function StatCard({ title, value, subtitle, icon, color }) {
  return (
    <div className={`stat-card ${color}`}>
      <div className="stat-icon">{icon}</div>
      <h4>{title}</h4>
      <h2>{value}</h2>
      <p>{subtitle}</p>
    </div>
  );
}

/* =========================
   SKELETON CARD
========================= */
function SkeletonStatCard() {
  return (
    <div className="stat-card skeleton">
      <div className="skeleton-icon"></div>
      <div className="skeleton-line title"></div>
      <div className="skeleton-line value"></div>
      <div className="skeleton-line subtitle"></div>
    </div>
  );
}

export default Dashboard;

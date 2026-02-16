// Admin mock data (used only for frontend demo)

export const dashboardStats = {
  totalFaculty: 45,
  totalDocuments: 312,
  pendingApprovals: 23
};

export const facultyList = [
  {
    id: "FAC001",
    name: "Dr. John Smith",
    department: "Computer Science",
    status: "Active"
  },
  {
    id: "FAC002",
    name: "Dr. Anjali Rao",
    department: "Electronics",
    status: "Active"
  },
  {
    id: "FAC003",
    name: "Dr. Ramesh Kumar",
    department: "Mechanical",
    status: "Inactive"
  }
];

export const documentsList = [
  {
    facultyId: "FAC001",
    facultyName: "Dr. John Smith",
    document: "PhD Certificate",
    category: "Academic",
    status: "Pending"
  },
  {
    facultyId: "FAC002",
    facultyName: "Dr. Anjali Rao",
    document: "FDP Certificate",
    category: "Professional",
    status: "Approved"
  },
  {
    facultyId: "FAC003",
    facultyName: "Dr. Ramesh Kumar",
    document: "Experience Letter",
    category: "Experience",
    status: "Rejected"
  }
];

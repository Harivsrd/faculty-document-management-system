import api from "./axios";

export const getFacultyDossier = (id) => {
  return api.get(`/admin/faculty/${id}`);
};


// export const getFacultyList = (search = "") => {
//   return api.get(`/admin/faculty?search=${search}`);
// };


export const getFacultyList = async () => {
  const res = await api.get("/admin/faculty");
  return res.data;
};

export const getAllDocuments = async (params) => {
  const res = await api.get("/admin/documents",{ params });
  return res.data;
};

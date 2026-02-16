import { BrowserRouter } from "react-router-dom";
import { useEffect, useState } from "react";
import AppContent from "./AppContent";
import { Toaster } from "react-hot-toast";
function App() {
  const [user, setUser] = useState(null);

  useEffect(() => {
    const token = localStorage.getItem("token");
    const savedUser = localStorage.getItem("user");

    if (token && savedUser) {
      setUser(JSON.parse(savedUser));
    } else {
      setUser(null);
    }
  }, []);

  return (
    <BrowserRouter>
          <Toaster position="top-right" toastOptions={{ duration: 3000,style: { fontSize: "14px"}}} />
      <AppContent user={user} setUser={setUser} />
    </BrowserRouter>
  );
}

export default App;

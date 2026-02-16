import { useEffect, useRef } from "react";
import { useNavigate } from "react-router-dom";

const INACTIVITY_TIME = 15 * 60 * 1000; // 15 minutes

export default function useAutoLogout(user, setUser) {
  const timer = useRef(null);
  const navigate = useNavigate();

  const logout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    setUser(null);
    navigate("/");
  };

  const resetTimer = () => {
    if (timer.current) clearTimeout(timer.current);
    timer.current = setTimeout(logout, INACTIVITY_TIME);
  };

  useEffect(() => {
    // 🚫 DO NOTHING IF USER NOT LOGGED IN
    if (!user) return;

    const events = [
      "mousemove",
      "keydown",
      "click",
      "scroll",
      "touchstart",
    ];

    events.forEach(event =>
      window.addEventListener(event, resetTimer)
    );

    resetTimer(); // start timer

    return () => {
      if (timer.current) clearTimeout(timer.current);
      events.forEach(event =>
        window.removeEventListener(event, resetTimer)
      );
    };
  }, [user]); // 👈 depends on user
}

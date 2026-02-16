import "./skeleton.css";

export function Skeleton({ height = 14, width = "100%", radius = 6 }) {
  return (
    <div
      className="skeleton"
      style={{
        height,
        width,
        borderRadius: radius
      }}
    />
  );
}

import "./LoginNavbar.css"
function LoginNavbar() {
    return (
  <div className="navbar">
        <div className="nav-left">
          <div className="logo">
            <img className="college_logo" src="/svec_logo.png" />
            <div className="login-nav-title">
              {/* <div>Document</div>
              <div>Management System</div> */}
              <div>Sri Vasavi Engineering College</div>
            </div> 
          </div>
        </div>
  
        <div className="nav-right">
          <div className="user-info">

          </div>

        </div>
      </div>
    )
}
export default LoginNavbar;
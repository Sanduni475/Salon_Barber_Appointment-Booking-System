import { Routes, Route } from "react-router-dom";

import Home from "../pages/Home";
import Login from "../pages/Login";
import Register from "../pages/Register";
import Services from "../pages/Services";
import Booking from "../pages/Booking";


function AppRoutes(){

    return(

        <Routes>

            <Route path="/" element={<Home />} />

            <Route path="/login" element={<Login />} />

            <Route path="/register" element={<Register />} />

            <Route path="/services" element={<Services />} />

            <Route path="/booking" element={<Booking />} />

        </Routes>

    );

}

export default AppRoutes;
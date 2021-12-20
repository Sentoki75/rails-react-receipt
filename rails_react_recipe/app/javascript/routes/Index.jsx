import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "../components/Home";
import Recipe from "../components/Recipes";

export default (
  <Router>
    <Routes>
      <Route path="/" exact element={<Home/>} />
      <Route path="/recipes" exact element={<Recipe/>} />
    </Routes>
  </Router>
);

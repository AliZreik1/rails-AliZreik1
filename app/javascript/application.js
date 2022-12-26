// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import Rails from "@rails/ujs";

Rails.start();
import DynamicTime from './dynamic_time';
import FetchGames from './fetch_games';

DynamicTime.init();
FetchGames.init();


	
	// function SetDate(){
	// 	document.getElementById("myDiv").setHTML(new Date());

	// }
	// document.getElementById("btn").addEventListener('click', SetDate);
	// window.setTimeout(function(){
	// 	document.getElementById("myDiv").setHTML("Click Bitch");

	// },1000)
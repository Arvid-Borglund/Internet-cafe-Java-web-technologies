function fetchWeatherData() {
	const apiKey = 'd35d87dec1913b2deacd3c88dd4b1a9d'; // Replace with your API key
	const lat = 39.042976246968365;
	const lon = 125.75927432594871;
	const units = 'metric'; // Use 'metric' for Celsius, 'imperial' for Fahrenheit

	const apiUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}&units=${units}`;

	$.ajax({
		url : apiUrl,
		type : 'GET',
		success : function(data) {
			$('#temperature').text(data.main.temp + '*C');
			$('#weather').text(data.weather[0].description);
		},
		error : function(error) {
			console.error('Error fetching weather data:', error);
		}
	});
}
$(document).ready(function() {
    fetchWeatherData();
});
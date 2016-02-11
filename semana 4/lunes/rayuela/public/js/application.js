function create_lanes() {
	for (var i=0;i<players.length;i++) {
		var player = players[i];
		lane = $('<div id="'+player+'-lane">');
		nametag = $('<div>');
		nametag.addClass('nametag');
		nametag.html(player);
		lane.append(nametag);
		pTable = create_table(player);
		lane.append(pTable);
		$('#board').append(lane);
	}
}

function create_table(playerName) {
	var table = $('<table>');
	var row = $('<tr>');
	for (var i=0;i<100;i++) {
		var td = $('<td id="'+playerName+'-'+i+'">');
		row.append(td);
	}
	table.append(row);
	return table;
	// $('#'+playerName+'-lane').append(table);
}

function move() {
	for (var i=0;i<players.length;i++) {
		var player = players[i];
		if (!stopped[player]) {
			position[player] = Math.min(100,position[player]+1);
		}
	}
}

function update_positions() {
	$('td').removeClass('active');
	for (var i=0;i<players.length;i++) {
		var player = players[i];
		$('#'+player+'-'+position[player]).addClass('active');
	}
}

function all_done() {
	for (var i=0;i<players.length;i++) {
		player = players[i];
		if (stopped[player] == false && position[player] < 100) {
			return false;
		}
	}
	return true;
};

function game_loop() {
	move();
	update_positions();
	if (all_done()) {
		clearInterval(g);
		var winText = evaluate_game();
		$('#winner').html(winText);
		sendResult();
	}
};

function sendResult() {
	data = {};
	result = resolve();
	data['players'] = players.join(',');
	if (result != -1) {
		data['winner'] = players[result];
	}
	$.ajax({
		url: '/result',
		method: 'post',
		data: data,
		success: function(e) {
			console.log(e);
			}
		});
}

function explain(result) {
	if (result == -1) {
		return "No one wins."
	} else {
		return players[result] + " wins.";
	}
}

function resolve() {
	diff = [];
	for (var i=0;i<players.length;i++) {
		player = players[i];
		diff.push(goal - position[player]);
	}
	if (diff[0] < 0 && diff[1] < 0) {
		return -1;
	}
	else if (diff[0] < 0) {
		return 1;
	}
	else if (diff[1] < 1) {
		return 0;
	}
	else if (diff[0] < diff[1]) {
		return 0;
	}
	else {
		return 1;
	}
}

function evaluate_game() {
	var result = resolve();
	return explain(result);
}

function game_init() {
	position = {};
	stopped = {};
	for (var i=0;i<players.length;i++) {
		player = players[i];
		position[player] = 0;
		stopped[player] = false;
	}
	update_positions();
}

function mark_goal(n) {
	for (var i=0;i<players.length;i++) {
		var player = players[i]
		$('#'+player+'-'+n).addClass('goal');
	}
}

function timer() {
	console.log('tick');
	var timeLeft = $('#start-timer').html();
	timeLeft = parseInt(timeLeft)-1;
	$('#start-timer').html(timeLeft);
	if (timeLeft == 0) {
		$('#start-timer').hide();
		clearInterval(t);
		g = setInterval(game_loop,gameSpeed);
	}
}

goal = 85;
timeStart = 1;
gameSpeed = 10;

$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded)
	// completamente.
	// Esto garantiza que si amarramos(bind) una función a un elemento
	// de HTML este exista ya en la página.
	console.log('hello, world!');
	create_lanes();

	$(document).on("keydown",function(e) {
		if (e.which == 81) {
			var player = players[0];
			stopped[player] = true;
		}
		if (e.which == 80) {
			var player = players[1];
			stopped[player] = true;
		}
	});
	game_init();
	mark_goal(goal);
	$('#start-button').on('click',function(e) {
		game_init();
		$('#start-timer').show();
		$('#start-timer').html(timeStart);
		t = setInterval(timer,1000);
		});
	});


function setup() {
    createCanvas(200, 200);
    let timer1 = createP('timer 1');
    let timer2 = createP('timer 2');

    let t1 = new makeTimer(timer1, 250, 0);
    let t2 = new makeTimer(timer2, 500, 255);
    console.log(t1);
}

function makeTimer(element, wait, strokeColor) {
    let closureCounter = 0;
    let x = 0;
    setInterval(closureTimeIt, wait);

    function closureTimeIt() {
        element.html(closureCounter);
        closureCounter++;
        draw();
    }
    function draw() {
        background(127);
        stroke(strokeColor);
        line(x, 0, x, height);
        x = x + 3;

    }
}


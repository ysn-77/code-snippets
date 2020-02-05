imgTag = document.querySelector('img');
touchCoordinates = [];
lastCoordinates = '';

function onClick(event) {
  const h = this.height;
  const w = this.width;
  const x = event.offsetX;
  const y = event.offsetY;
  touchCoordinates.push(
    `t:${Math.round(100*x/w)}:${Math.round(100*y/h)}`
  );
  lastCoordinates = touchCoordinates.join(',');
  console.log(lastCoordinates);
}

document.addEventListener('keydown', _ => {
  console.clear();
  console.log(lastCoordinates);
  console.log()
  touchCoordinates = [];
});

imgTag.addEventListener('click', onClick);
console.clear();

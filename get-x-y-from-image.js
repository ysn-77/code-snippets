imgTag = document.querySelector('img');
touchCoordinates = [];
lastCoordinates = '';

function onClick(event) {
  const imgX = Math.round(100 * event.offsetX / this.width );
  const imgY = Math.round(100 * event.offsetY / this.height);
  touchCoordinates.push(`t:${imgX}:${imgY}`);
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

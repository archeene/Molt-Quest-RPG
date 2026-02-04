const fs = require('fs');
const path = require('path');

// Read the image file
const imagePath = path.join(__dirname, 'logo-temp.jpg');
const imageBuffer = fs.readFileSync(imagePath);
const base64Image = imageBuffer.toString('base64');

// Prepare the payload
const payload = {
  image: `data:image/jpeg;base64,${base64Image}`,
  name: 'moltrpg-logo'
};

console.log(JSON.stringify(payload));

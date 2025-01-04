
console.log("app.js loaded");

document.getElementById('sbt-button').addEventListener('click', sendmail);


function sendmail()
{
    let name = document.getElementById('name-customer').value;   
    let email = document.getElementById('email-customer').value;
    let subject = document.getElementById('sbj-mail').value;
    let message = document.getElementById('msg-mail').value;

    console.log(name, email, subject, message);
    console.log("sending mail");
 
    fetch('/api', {
      
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            from: email,
            to: 'diegoaguia31@gmail.com',
            subject: subject,
            message: message
        })
    })
    .then(response => response.text())
    .then(data => {
        console.log(response.text());
        alert(data);
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error sending email');
    });
}
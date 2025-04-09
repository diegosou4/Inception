

console.log("app.js loaded");

document.getElementById('sbt-button').addEventListener('click', sendmail);
document.getElementById('get-mycv').addEventListener('click', getCV);

function getCV() { 
    fetch('/api', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        const filePath = data.file;
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = 'https://diegmore.42.fr/' + filePath;
                a.download = filePath;
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
                alert('CV downloaded successfully');
            })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        alert('Error downloading CV');
    });
}

function validateEmail(email)
{
    const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    return regex.test(email);

}

function sendmail()
{
    let name = document.getElementById('name-customer').value;   
    let email = document.getElementById('email-customer').value;
    let subject = document.getElementById('sbj-mail').value;
    let message = document.getElementById('msg-mail').value;

    
    if(validateEmail(email) == false)
    {
        alert('Invalid email');
        return;
    }
    fetch('/api', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            name: name,
            from: email,
            subject: subject,
            message: message
        })
    })
    .then(response => response.text())
    .then(data => {
        console.log(data); 
        alert(data);
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error sending email');
    });
}
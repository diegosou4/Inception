


document.getElementById('sbt-button').addEventListener('click', sendmail);


function sendmail()
{
    let name = document.getElementById('name-customer').value;   
    let email = document.getElementById('email-customer').value;
    let subject = document.getElementById('sbj-mail').value;
    let message = document.getElementById('msg-mail').value;

    if (name == "" || email == "" || subject == "" || message == "")
    {
        alert("Please fill all fields");
        return;
    }
    console.log(name, email, subject, message);
    console.log("sending mail");
}
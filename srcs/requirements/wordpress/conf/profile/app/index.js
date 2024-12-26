

const { exec } = require('child_process');

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

    exec('sendmail -s postfix:25 -f' + email + ' -t' + email + ' -u' + subject + ' -m' + message, (err, stdout, stderr) => {
        if (err) {
            console.error(err);
            return;
        }
        console.log(stdout);
    });
}
// Vou ter que fazer uma Api em node js para enviar
// O email no caso um front-end que envia a requisicao para o Back-end
// Que ideia burra minha ne?
// Agora vou ter que fazer
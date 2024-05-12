let usuario = null;
let usu_admin= "0";
let posicion = 0;

function fMoverI(){

    posicion -= 1;
    if (posicion < 0){
        posicion = 0;
    }
    
    document.querySelector("#tira").style.left =
        ( -posicion * 240 ) + "px";
}
function fMoverD(){
    
    posicion += 1;
    if (posicion > 3){
        posicion = 0;
    }
    
    document.querySelector("#tira").style.left =
        ( -posicion * 240 ) + "px";
}

function fInicio(){
    fMostrar("form_login");
}

function fMostrar(formulario){
    //Ocultar todos los formularios
    let todos = document.querySelectorAll("#div_modal > form");
    console.log("Todos", todos);
    for(i=0; i < todos.length; i++){
        todos[i].style.display = "none";
    }
    // Mostrar el formulario que me piden
    document.querySelector("#" + formulario).style.display = "block";
    //Mostrar la modal
    document.querySelector("#div_modal").style.display = "flex";
}

function fControlLogin(){
    // Leer el alias
    let alias = document.querySelector("#alias").value;
    // Leer el password
    let password = document.querySelector("#password").value;
    // Buscar el alias y el password en la BBDD
    let URL = 'assets/php/servidor.php?peticion=ControlLogin';
    URL += "&alias=" + alias;
    URL += "&password=" + password;
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            // Si es correcto
            if (data.datos.length > 0){
            //      cerrar la modal
                document.querySelector("#div_modal").style.display = "none";
                let foto = data.datos[0].usu_foto;
                let ruta = "assets/fotos/";
                document.querySelector("#div_foto>img").src = ruta + foto;
                document.querySelector("#div_foto>img").title = data.datos[0].usu_alias;
                usuario = data.datos[0]
                usu_admin = usuario.usu_admin
                console.log(usu_admin)
                fMostrarPalas()
            } else {
                // si no
                //      mensaje de error
                document.querySelector("#div_error").innerHTML = "Acceso denegado";
            }      
        })
}



function fControlRegistrar(){
    // Leer el alias
    let alias = document.querySelector("#ralias").value;
    // Leer el email
    let nombre = document.querySelector("#rnombre").value;
    // Leer el password
    let password = document.querySelector("#rpassword").value;
    let password2 = document.querySelector("#rrpassword").value;
    // Comprobar los password
    if (password != password2){
        document.querySelector("#rdiv_error").innerHTML = "Los password no coinciden";
        return;
    }
    // Buscar el alias y el password en la BBDD
    let URL = 'assets/php/servidor.php?peticion=ControlRegistro';
    URL += "&alias=" + alias;
    URL += "&password=" + password;
    URL += "&nombre=" + password;
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log("REGISTRO",data);  
            if (data.datos == 0){
                document.querySelector("#rdiv_error").innerHTML = "Inténtelo mas tarde";
                return;
            }
            // Mostrar un mensaje
            document.querySelector("#mensaje").innerHTML = "Registro correcto";
            fMostrar("form_mensaje"); 
            // Pasado x tiempo, mostrar el formulario de login
            evento = setTimeout(fCerrarEvento, 2000);

              
        })
}

function fCerrarEvento(){
    fMostrar("form_login"); 
}

function fCancelar(){
    document.querySelector("#div_modal").style.display = "none";
}

function fMostrarFotosCarrusel(){
    const URL = "assets/php/servidor.php?peticion=FotosCarrusel";
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log("Fotos", data);
            let html = "";
            for (i=0; i< data.datos.length; i++){
                let ruta = "assets/Fotos/" + data.datos[i].p_foto;
                html+= `<div><a href=""><img src="${ruta}" alt=""></a></div>`
            }
            document.querySelector("#tira").innerHTML = html;

            })

            
}

function fMostrarPalas(){
    const URL = "assets/php/servidor.php?peticion=palas";
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log("palas", data);
            let html = "";
            for (i=0; i< data.datos.length; i++){
                let ruta = "assets/Fotos/" + data.datos[i].p_foto;
                html+= `<div class="pala">`
                html+= `    <div class="pala_bloque">`
                html+= `        <div class="foto_p">`
                html+= `        <div><img src="${ruta}" alt=""></div>`
                html+= `        </div>`
                html+= `        <div class="nombre_p">`
                html+= "        <h1>" + data.datos[i].p_nombre +"</h1>"
                html+= `        </div>`
                html+= `        <div class="precio_p">`
                html+= "        <h2>" + data.datos[i].p_precio + " €" + "</h2>"
                html+= `        </div>`
                html+= `    </div>`
                html+= `        <div class="descripcion_p">`
                html+= "        <h1>" + data.datos[i].p_descrip +"</h1>"
                html+= `        </div>`
                html+= `    </div>`
                
            }
            document.querySelector(".palas").innerHTML = html;

            })
}

function fModoOscuro(){
    if (document.body.classList.contains('dark')){
        document.body.classList.remove('dark')
    }else {
        document.body.classList.add('dark')
    }
}
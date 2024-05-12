<?php
require_once("BBDD_CTRLR.php");

if (isset($_REQUEST['peticion'])) {
    switch ($_REQUEST['peticion']) {
        case "EjecutarConsulta":
            $sql = "SELECT t.* ,COUNT(men_id) as cuenta FROM temas as t left join mensajes as m on t.tema_id = m.men_tema_id GROUP BY t.tema_id";
            $datos['sql']=$sql;
            // Ejecuto el SQL guardando el resultado
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los datos codificados como JSON
            echo json_encode($datos);  
            break;
        case "ControlLogin":
            // Recuperar parametros
            $alias = $_REQUEST['alias'];
            $password = $_REQUEST['password'];
            // Preparo el SQL
            $sql = "SELECT * FROM usuarios WHERE usu_alias = '$alias' AND usu_password=md5('$password')";
            $datos['sql']=$sql;
            // Ejecuto el SQL guardando el resultado
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los datos codificados como JSON
            echo json_encode($datos);  
            break; 
        case "ControlRegistro":
            $alias = $_REQUEST['alias'];
            $password = $_REQUEST['password'];
            $nombre = $_REQUEST['nombre'];
            $sql = "INSERT INTO usuarios VALUES ( null, '$nombre', '$alias', md5('$password'), 'u02.gif', '0' )";
            $datos['sql']=$sql;
            //  si no es i devuelve el nº de registros procesados
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, 'i');
            // Devuelvo a JS los datos codificados como JSON
            echo json_encode($datos);  
            break;
        case "FotosCarrusel":
            $sql = "SELECT p_foto from palas_padel order by p_precio";
            $datos['sql']=$sql;
            // Ejecuto el SQL guardando el resultado
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los datos codificados como JSON
            echo json_encode($datos);  
            break;
        case "palas":
            $sql = "SELECT * from palas_padel order by p_precio";
            $datos['sql']=$sql;
            // Ejecuto el SQL guardando el resultado
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los datos codificados como JSON
            echo json_encode($datos);  
            break;
    }       
}
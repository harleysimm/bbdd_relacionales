select * from editoriales

select libros.titulo, editoriales.nombre
from editoriales
left join libros on editoriales.codigo = libros.codigoeditorial

select libros.titulo, editoriales.nombre
from libros
left join editoriales on editoriales.codigo = libros.codigoeditorial
where editoriales.codigo is null
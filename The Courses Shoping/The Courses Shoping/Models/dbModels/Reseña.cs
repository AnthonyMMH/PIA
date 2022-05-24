using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    public partial class Reseña
    {
        public Reseña()
        {
            Cursos = new HashSet<Curso>();
        }

        [Key]
        public int IdReseña { get; set; }
        [StringLength(200)]
        public string Descripcion { get; set; }
        public int IdUsuario { get; set; }

        [InverseProperty(nameof(Curso.ReseñasNavigation))]
        public virtual ICollection<Curso> Cursos { get; set; }
    }
}

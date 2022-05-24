using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    public partial class Curso
    {
        public Curso()
        {
            CursoMaestros = new HashSet<CursoMaestro>();
        }

        [Key]
        public int IdCurso { get; set; }
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }
        [Required]
        [StringLength(20)]
        public string Precio { get; set; }
        [Required]
        [StringLength(200)]
        public string Descripcion { get; set; }
        [Required]
        public string Imagenes { get; set; }
        public int? Reseñas { get; set; }

        [ForeignKey(nameof(IdCurso))]
        [InverseProperty(nameof(ApplicationUser.Cursos))]
        public virtual ApplicationUser IdCursoNavigation { get; set; }
        [ForeignKey(nameof(Reseñas))]
        [InverseProperty(nameof(Reseña.Cursos))]
        public virtual Reseña ReseñasNavigation { get; set; }
        [InverseProperty(nameof(CursoMaestro.IdCursoNavigation))]
        public virtual ICollection<CursoMaestro> CursoMaestros { get; set; }
    }
}

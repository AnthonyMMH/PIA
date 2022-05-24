using System;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    public partial class ProyectoContext : IdentityDbContext<ApplicationUser, IdentityRole<int>, int>
    {
        public ProyectoContext()
        {
        }

        public ProyectoContext(DbContextOptions<ProyectoContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Curso> Cursos { get; set; }
        public virtual DbSet<CursoMaestro> CursoMaestros { get; set; }
        public virtual DbSet<Maestro> Maestros { get; set; }
        public virtual DbSet<NivelAcademico> NivelAcademicos { get; set; }
        public virtual DbSet<Reseña> Reseñas { get; set; }
        public virtual DbSet<VcursoCursoMaestroMaestro> VcursoCursoMaestroMaestros { get; set; }
        public virtual DbSet<VcursoReseña> VcursoReseñas { get; set; }
        public virtual DbSet<VmaestroNivelAcademico> VmaestroNivelAcademicos { get; set; }

     

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<Curso>(entity =>
            {
                entity.Property(e => e.Descripcion).IsFixedLength(true);

                entity.Property(e => e.Precio).IsFixedLength(true);

                entity.HasOne(d => d.ReseñasNavigation)
                    .WithMany(p => p.Cursos)
                    .HasForeignKey(d => d.Reseñas)
                    .HasConstraintName("FK_Cursos_Reseñas");
                entity.HasOne(d => d.IdCursoNavigation)
               .WithMany(p => p.Cursos)
               .HasForeignKey(d => d.IdCurso)
               .HasConstraintName("FK_Curso_Cursos");
            });

            modelBuilder.Entity<CursoMaestro>(entity =>
            {
                entity.HasKey(e => new { e.IdCurso, e.IdMaestro });

                entity.HasOne(d => d.IdCursoNavigation)
                    .WithMany(p => p.CursoMaestros)
                    .HasForeignKey(d => d.IdCurso)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CursoMaestro_Cursos");

                entity.HasOne(d => d.IdMaestroNavigation)
                    .WithMany(p => p.CursoMaestros)
                    .HasForeignKey(d => d.IdMaestro)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CursoMaestro_Maestros");
            });

            modelBuilder.Entity<Maestro>(entity =>
            {
                entity.Property(e => e.Curriculum).IsFixedLength(true);

                entity.Property(e => e.Nombre).IsFixedLength(true);

                entity.HasOne(d => d.NivelAcademicoNavigation)
                    .WithMany(p => p.Maestros)
                    .HasForeignKey(d => d.NivelAcademico)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Maestros_NivelAcademico");
            });

            modelBuilder.Entity<Reseña>(entity =>
            {
                entity.HasKey(e => e.IdReseña)
                    .HasName("PK_Reseñas_1");

                entity.Property(e => e.IdReseña).ValueGeneratedNever();
            });

            modelBuilder.Entity<VcursoCursoMaestroMaestro>(entity =>
            {
                entity.ToView("VCurso-CursoMaestro-Maestro");

                entity.Property(e => e.Curriculum).IsFixedLength(true);

                entity.Property(e => e.Descripcion).IsFixedLength(true);

                entity.Property(e => e.Expr1).IsFixedLength(true);

                entity.Property(e => e.Precio).IsFixedLength(true);
            });

            modelBuilder.Entity<VcursoReseña>(entity =>
            {
                entity.ToView("VCurso-Reseña");

                entity.Property(e => e.Descripcion).IsFixedLength(true);

                entity.Property(e => e.Precio).IsFixedLength(true);
            });

            modelBuilder.Entity<VmaestroNivelAcademico>(entity =>
            {
                entity.ToView("VMaestro-NivelAcademico");

                entity.Property(e => e.Curriculum).IsFixedLength(true);

                entity.Property(e => e.Nombre).IsFixedLength(true);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

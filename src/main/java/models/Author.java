package models;

import lombok.Data;

import javax.persistence.*;

@Entity @Data
@Table(name = "author", schema = "public")
public class Author {

    @Id
    @SequenceGenerator(name = "authSeq", sequenceName = "SEQUENCE_ID_AUTHOR", allocationSize = 1)
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "authSeq")
    private Integer id_author;

    public Integer getId_author() {
        return id_author;
    }

    public void setId_author(Integer id_author) {
        this.id_author = id_author;
    }

    @Column
    private String name_author;

    public String getName_author() {
        return name_author;
    }

    public void setName_author(String name_author) {
        this.name_author = name_author;
    }

    @Column
    private String description_author;

    public String getDescription_author() {
        return description_author;
    }

    public void setDescription_author(String description_author) {
        this.description_author = description_author;
    }

    @Column
    private String icon_author_path;

    public String getIcon_author_path() {

        return icon_author_path;
    }

    public void setIcon_author_path(String icon_author_path) {
        this.icon_author_path = icon_author_path;
    }


    public Author() {

    }

    @Override
    public String toString() {
        return "models.Author{" +
                "id_author=" + id_author +
                ", name_author='" + name_author + '\'' +
                ", description_author=" + description_author +
                ", icon_author_path=" + icon_author_path +
                '}';
    }
}

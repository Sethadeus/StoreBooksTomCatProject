package models;

import org.hibernate.mapping.Collection;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "publishinghouse")
public class Publishinghouse {
    @Id
    @SequenceGenerator(name = "pubSeq", sequenceName = "SEQUENCE_ID_PUBLISHING_HOUSE", allocationSize = 1)
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "pubSeq")
    private Integer id_publishing_house;

    private String name_publishing_house;

    @OneToMany (mappedBy="publishingHouse", fetch=FetchType.LAZY)
    private Set<Book> tenants;

    public Integer getId_publishing_house() {
        return id_publishing_house;
    }

    public void setId_publishing_house(Integer id_publishing_house) {
        this.id_publishing_house = id_publishing_house;
    }


    public Set<Book> getTenants() {
        return tenants;
    }

    public void setTenants(Set<Book> tenants) {
        this.tenants = tenants;
    }

    public String getName_publishing_house() {
        return name_publishing_house;
    }

    public void setName_publishing_house(String name_publishing_house) {
        this.name_publishing_house = name_publishing_house;
    }

    public Publishinghouse() {
    }
}
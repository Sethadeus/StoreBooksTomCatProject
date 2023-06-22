package models;

import javax.persistence.*;
import java.util.Set;
import java.util.stream.Collectors;

@Entity
@Table(name = "book")
public class Book {
    @Id
    @Column(name = "id_book", nullable = false)
    @SequenceGenerator(name = "bookSeq", sequenceName = "SEQUENCE_ID_BOOK", allocationSize = 1)
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "bookSeq")
    private Integer id_book;

    @Column(name = "name_book", nullable = false)
    private String name_book;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "price", nullable = false)
    private Integer price;

    @Column(name = "new_price")
    private Integer new_price;

    @Column(name = "avail", nullable = false)
    private Boolean avail = false;

    @Column(name = "number_page")
    private Integer numberPage;

    @Column(name = "icon_path")
    private String icon_path;

    @Column(name = "year_release")
    private Integer year_release;

    @ManyToOne (optional=false, cascade=CascadeType.ALL)
    @JoinColumn (name="id_author")
    private Author author;

    @Column(name = "id_author", insertable = false, updatable = false)
    private Integer id_author;

    @Column(name = "id_publishing_house", insertable = false, updatable = false)
    private Integer id_publishing_house;


    @ManyToOne (optional=false, cascade=CascadeType.ALL)
    @JoinColumn (name="id_publishing_house")
    private Publishinghouse publishingHouse;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "bookgenre",
            joinColumns = @JoinColumn(name = "id_book"),
            inverseJoinColumns = @JoinColumn(name = "id_genre")
    )
    private Set<Genre> genres;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "samebook",
            joinColumns = @JoinColumn(name = "id_book"),
            inverseJoinColumns = @JoinColumn(name = "id_same_book")
    )
    private Set<Book> samebooks;

    public Publishinghouse getPublishingHouse() {
        return publishingHouse;
    }

    public void setPublishingHouse(Publishinghouse publishingHouse) {
        this.publishingHouse = publishingHouse;
    }

    public Integer getId_book() {
        return id_book;
    }

    public void setId_book(Integer id_book) {
        this.id_book = id_book;
    }

    public String getName_book() {
        return name_book;
    }

    public void setName_book(String name_book) {
        this.name_book = name_book;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Boolean getAvail() {
        return avail;
    }

    public void setAvail(Boolean avail) {
        this.avail = avail;
    }

    public Integer getNumberPage() {
        return numberPage;
    }

    public void setNumberPage(Integer numberPage) {
        this.numberPage = numberPage;
    }

    public String getIcon_path() {
        return icon_path;
    }

    public void setIcon_path(String icon_path) {
        this.icon_path = icon_path;
    }

    public Integer getYear_release() {
        return year_release;
    }

    public void setYear_release(Integer year_release) {
        this.year_release = year_release;
    }

    public Integer getId_author() {
        return id_author;
    }

    public void setId_author(Integer id_author) {
        this.id_author = id_author;
    }

    public Integer getId_publishing_house() {
        return id_publishing_house;
    }

    public void setId_publishing_house(Integer id_publishing_house) {
        this.id_publishing_house = id_publishing_house;
    }

    public Integer getNew_price() {
        return new_price;
    }

    public void setNew_price(Integer new_price) {
        this.new_price = new_price;
    }

    public Set<Genre> getGenres() {
        return genres;
    }

    public void setGenres(Set<Genre> genres) {
        this.genres = genres;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Set<Book> getSamebooks() {
        return samebooks;
    }

    public void setSamebooks(Set<Book> samebooks) {
        this.samebooks = samebooks;
    }

    public String getGenreStringFormst() {
        String res = "";
        for (Genre obj: genres) {
            res += String.valueOf(obj.getId_genre());
            res += ",";
            }
        return res;
    }

    public String getSameBookStringFormst() {
        String res = "";
        for (Book obj: samebooks) {
            res += String.valueOf(obj.getId_book());
            res += ",";
        }
        return res;
    }

}
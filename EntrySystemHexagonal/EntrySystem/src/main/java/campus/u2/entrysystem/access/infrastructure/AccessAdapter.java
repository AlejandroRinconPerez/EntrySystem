package campus.u2.entrysystem.access.infrastructure;

import campus.u2.entrysystem.access.application.AccessRepository;
import campus.u2.entrysystem.access.domain.Access;
import org.springframework.stereotype.Service;
import java.util.Date;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class AccessAdapter implements AccessRepository{
    
    //Atributtes 
    private final AccessJpaRepository accessRepository; 
    
    // Constructor 
    public AccessAdapter(AccessJpaRepository accessRepository){
        this.accessRepository = accessRepository; 
    }
    
    //Methods 

    // To create an access
    @Override 
    @Transactional
    public Access saveAccess(Access access) {
        return accessRepository.save(access);
    }
    
    // To delete an access
    @Override 
    @Transactional
    public void deleteAccess(Long id) {
        Optional<Access> accessOpt = accessRepository.findById(id); 
        if (accessOpt.isPresent()) {
            accessRepository.delete(accessOpt.get());
        }
    }
   
    // To get all accesses
    @Override 
    @Transactional
    public List<Access> getAllAccesses() {
        return accessRepository.findAll();
    }

    // To get an access by id
    @Override 
    @Transactional
    public Optional<Access> getAccessById (Long id) {
        return accessRepository.findById(id);
    }
    
    // To find all the access between two dates
    @Override 
    @Transactional
    public List<Access> findAccessBetweenDates(Date startDate, Date endDate) {
        return accessRepository.findByEntryAccessBetween(startDate, endDate);
    }
}

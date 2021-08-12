package sopra.formation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopra.formation.model.RDV;
import sopra.formation.model.Statut;
import sopra.formation.repository.IRDVRepository;

@Controller
public class RDVController {

	@Autowired
	private IRDVRepository rdvRepo;
	
	@GetMapping("/rdv")
	public String list(Model model) {
		
		List<RDV> rdvs = this.rdvRepo.findAll();
		
		model.addAttribute("mesrdvs", rdvs);
		
		return "rdv/list";		
	}
	
	@GetMapping("/rdv/add")
	public String add(Model model) {
		model.addAttribute("statuts", Statut.values());
		
		return "rdv/form";
	}
	
	@GetMapping("/rdv/edit")
	public String edit(@RequestParam Long id, Model model) {
		
		RDV rdv = rdvRepo.findById(id).get();

		model.addAttribute("statuts", Statut.values());
		model.addAttribute("rdv", rdv);

		return "rdv/form";
	}
	
	@PostMapping("/rdv/save")
	public String save(@RequestParam(required = false) Long id, @RequestParam(required = false, defaultValue = "0") int version, @RequestParam(required = false) Statut statut) {

	RDV rdv = new RDV();

	rdv.setId(id);
	rdv.setVersion(version);
	rdv.setStatut(statut);

	rdvRepo.save(rdv);

	return "redirect:/rdv";
}

	@GetMapping("/rdv/delete")
	public String delete(@RequestParam Long id) {
		rdvRepo.deleteById(id);
		
		return "redirect:/rdv";
	}
	
	@GetMapping("/rdv/cancel")
	public String cancel() {
		return "forward:/rdv";
	}
}


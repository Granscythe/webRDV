package sopra.formation.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopra.formation.model.Lieu;
import sopra.formation.repository.ILieuRepository;


@Controller
public class LieuController {

	@Autowired
	private ILieuRepository lieuRepo;

	@GetMapping("/lieu") // ETAPE 1
	public String list(Model model) {
		// ETAPE 2
		List<Lieu> lieux = this.lieuRepo.findAll();

		// ETAPE 3
		model.addAttribute("mesLieux", lieux);

		// ETAPE 4
		return "lieu/list";
	}

	@GetMapping("/lieu/add")
	public String add() {
		// ETAPE 2 et 3 inutile
		// ETAPE 4
		return "lieu/form";
	}

	@GetMapping("/lieu/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		// ETAPE 2
		Lieu lieu = lieuRepo.findById(id).get();

		// ETAPE 3
		model.addAttribute("lieu", lieu);

		// ETAPE 4
		return "lieu/form";
	}
	
	@PostMapping("/lieu/save")
	public String save(@RequestParam(required = false) Long id, @RequestParam(required = false, defaultValue = "0") int version, @RequestParam String typeLieu ,  @RequestParam String rue , @RequestParam String ville, @RequestParam String codePostal, @RequestParam int numero) {
		Lieu lieu = new Lieu(typeLieu, rue, ville, codePostal, numero); 
		lieu.getId();  
		lieuRepo.save(lieu);
		
		return "redirect:/lieu";
	}

	@GetMapping("/lieu/delete")
	public String delete(@RequestParam Long id) {
		lieuRepo.deleteById(id);
		
		return "redirect:/lieu";
	}
	
	@GetMapping("/lieu/cancel")
	public String cancel() {
		return "forward:/lieu";
	}
}
	



	


- [ ]Adjust landlord/show.html.erb - align
- [ ]Search form - Need to only show cities in selected province
- [ ]landlord new form needs formatting


Search form snippet
<div class="search-form-wrapper center">
	<%= form_tag(landlords_path, :method => "get") do %>
  		<%= text_field_tag :search, params[:search], placeholder:"Enter a name..." , class:"user-search-input"%>
  		<div class="controls">
			<%= collection_select :province, params[:province_id], Province.order(:name), :id, :name, include_blank: "Province" %>
		</div>
		<div class="controls">
			<%= grouped_collection_select :city, :city_id, Province.order(:name), :cities, :name,  :id, :name, include_blank: "City" %>	
		</div>
		<%= submit_tag "City Map", :name => 'map_button', class:'btn' %>
  		<%= submit_tag "Search", :name => 'search_button', class:'btn' %>
  		<%= link_to  "All", landlords_path, class:'btn' %>  	
	<% end %> 
</div>
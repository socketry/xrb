#!/usr/bin/env ruby
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

# frozen_string_literal: true

require 'bundler/inline'

gemfile do
	source 'https://rubygems.org'
	gem 'benchmark-ips'
	gem 'xrb'
	gem 'erb'
	gem 'erubi'
end

ERB_SRC = <<~'ERB'
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent gravida, turpis id bibendum bibendum, ipsum diam vestibulum arcu, sit amet tempor ipsum lorem non urna. Suspendisse nec nisl a risus laoreet lacinia ac sit amet neque. Mauris vel turpis semper massa bibendum viverra. Curabitur vel felis est. Donec sed faucibus augue, ac molestie purus. Nulla a lectus dui. Quisque id scelerisque urna. Aenean in vehicula nibh, in aliquam turpis. <%='<Suspendisse>'%> iaculis suscipit lectus in efficitur. Nulla facilisi. Fusce facilisis, justo ac eleifend convallis, ligula est bibendum risus, a consequat metus sapien eget mauris. Sed quis mollis tellus, sed tempor lacus. Proin et efficitur metus. Vestibulum blandit tellus sed turpis tincidunt, in aliquet augue bibendum. Suspendisse venenatis faucibus lectus sed convallis.
<%='Curabitur'%> aliquet ligula et volutpat efficitur. Duis sed tortor elit. Quisque justo eros, maximus quis elit sed, accumsan faucibus lectus. Nulla blandit quam urna, ac bibendum turpis semper quis. Proin a ligula eu eros semper condimentum. Ut pellentesque, justo sed malesuada condimentum, est massa tempor turpis, id facilisis neque odio eu neque. Morbi convallis laoreet tortor, ut dapibus mi accumsan a. Proin convallis neque sed leo blandit lacinia. Phasellus porta odio nunc, quis placerat sem facilisis quis. Quisque et <%='ornare'%> elit. Duis efficitur cursus lectus vitae placerat. In lacinia eros nec feugiat finibus.
Morbi orci magna, tempor at convallis sed, porta elementum nulla. Aliquam sit amet fringilla felis, eget volutpat lorem. Pellentesque laoreet, elit quis fringilla ultricies, leo nisl semper mauris, ac feugiat libero tortor id urna. Praesent ligula augue, mollis nec justo vitae, faucibus posuere risus. Praesent blandit molestie ex eu fringilla. Ut non vehicula mauris. Aliquam gravida rutrum laoreet. Pellentesque facilisis mi ipsum, ac dapibus mi iaculis nec.
Vestibulum sit amet nibh velit. Sed rhoncus odio ut nisi blandit vestibulum. Aliquam erat volutpat. Suspendisse sed posuere ligula. Proin ex ex, pharetra vel dui vulputate, pellentesque ullamcorper metus. Cras imperdiet dictum lorem. Nullam eleifend nunc eu metus ullamcorper dignissim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet sem sed enim rutrum volutpat a non libero.
<% 100.downto(1) do |i| %>
	<%=i%> bottle<%=i == 1 ? '' : 's'%> of beer on the wall,
	<%=i%> bottle<%=i == 1 ? '' : 's'%> of beer,
	Take one down and pass it around,
	<%=i-1%> bottle<%=i == 1 ? '' : 's'%> of beer on the wall.
<% end %>
Integer in ligula at ex gravida pellentesque in et felis. Nulla dolor sapien, pretium a odio a, consectetur ultrices justo. Suspendisse libero quam, pulvinar eu est non, fermentum volutpat nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras at dapibus lorem, nec imperdiet quam. Proin ut tellus sagittis, sollicitudin elit ac, porttitor diam. Quisque at hendrerit lacus, sit amet mollis lacus.
ERB

XRB_SRC = <<~'XRB'
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent gravida, turpis id bibendum bibendum, ipsum diam vestibulum arcu, sit amet tempor ipsum lorem non urna. Suspendisse nec nisl a risus laoreet lacinia ac sit amet neque. Mauris vel turpis semper massa bibendum viverra. Curabitur vel felis est. Donec sed faucibus augue, ac molestie purus. Nulla a lectus dui. Quisque id scelerisque urna. Aenean in vehicula nibh, in aliquam turpis. #{'<Suspendisse>'} iaculis suscipit lectus in efficitur. Nulla facilisi. Fusce facilisis, justo ac eleifend convallis, ligula est bibendum risus, a consequat metus sapien eget mauris. Sed quis mollis tellus, sed tempor lacus. Proin et efficitur metus. Vestibulum blandit tellus sed turpis tincidunt, in aliquet augue bibendum. Suspendisse venenatis faucibus lectus sed convallis.
#{'Curabitur'} aliquet ligula et volutpat efficitur. Duis sed tortor elit. Quisque justo eros, maximus quis elit sed, accumsan faucibus lectus. Nulla blandit quam urna, ac bibendum turpis semper quis. Proin a ligula eu eros semper condimentum. Ut pellentesque, justo sed malesuada condimentum, est massa tempor turpis, id facilisis neque odio eu neque. Morbi convallis laoreet tortor, ut dapibus mi accumsan a. Proin convallis neque sed leo blandit lacinia. Phasellus porta odio nunc, quis placerat sem facilisis quis. Quisque et #{'ornare'} elit. Duis efficitur cursus lectus vitae placerat. In lacinia eros nec feugiat finibus.
Morbi orci magna, tempor at convallis sed, porta elementum nulla. Aliquam sit amet fringilla felis, eget volutpat lorem. Pellentesque laoreet, elit quis fringilla ultricies, leo nisl semper mauris, ac feugiat libero tortor id urna. Praesent ligula augue, mollis nec justo vitae, faucibus posuere risus. Praesent blandit molestie ex eu fringilla. Ut non vehicula mauris. Aliquam gravida rutrum laoreet. Pellentesque facilisis mi ipsum, ac dapibus mi iaculis nec.
Vestibulum sit amet nibh velit. Sed rhoncus odio ut nisi blandit vestibulum. Aliquam erat volutpat. Suspendisse sed posuere ligula. Proin ex ex, pharetra vel dui vulputate, pellentesque ullamcorper metus. Cras imperdiet dictum lorem. Nullam eleifend nunc eu metus ullamcorper dignissim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet sem sed enim rutrum volutpat a non libero.
<?r 100.downto(1) do |i| ?>
	#{i} bottle#{i == 1 ? '' : 's'} of beer on the wall,
	#{i} bottle#{i == 1 ? '' : 's'} of beer,
	Take one down and pass it around,
	#{i-1} bottle#{i == 1 ? '' : 's'} of beer on the wall.
<?r end ?>
Integer in ligula at ex gravida pellentesque in et felis. Nulla dolor sapien, pretium a odio a, consectetur ultrices justo. Suspendisse libero quam, pulvinar eu est non, fermentum volutpat nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras at dapibus lorem, nec imperdiet quam. Proin ut tellus sagittis, sollicitudin elit ac, porttitor diam. Quisque at hendrerit lacus, sit amet mollis lacus.
XRB

ERB_TEMPLATE = ERB.new(ERB_SRC)
XRB_TEMPLATE = XRB::Template.new(XRB::Buffer.load(XRB_SRC))

module Templates
	extend self
	
	ERUBI_SRC = Erubi::Engine.new(ERB_SRC, freeze_template_literals: false, chain_appends: true).src
	XRB_SRC = XRB_TEMPLATE.code
	
	class_eval <<~RUBY
		# frozen_string_literal: true
		def erubi_render
			#{ERUBI_SRC}
		end
		
		def xrb_render
			_out = String.new; _out.singleton_class.alias_method(:raw, :<<)
			#{XRB_SRC}
			return _out
		end
	RUBY
	
	puts "--- ERUBI_SRC ---", ERUBI_SRC
	puts "--- XRB_SRC ---", XRB_SRC
end

# Compile time:
Benchmark.ips do |x|
	x.report('ERB (erubi)') { Erubi::Engine.new(ERB_SRC, freeze_template_literals: false, chain_appends: true).src}
	x.report('XRB') { XRB::Template.new(XRB::Buffer.load(XRB_SRC)).code }
	x.compare!
end

Benchmark.ips do |x|
	x.report('ERB (eval)') { ERB_TEMPLATE.result }
	x.report('XRB') { XRB_TEMPLATE.to_string }
	x.report('XRB (method)') { Templates.xrb_render }
	x.report('ERB (erubi)') { Templates.erubi_render }
	x.compare!
end

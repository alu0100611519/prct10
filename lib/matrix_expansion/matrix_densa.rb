require "./lib/matrix_expansion/matrix.rb"
module MatrixExpansion
class MatrizDensa<Matriz
	
  attr_accessor :fil, :col, :valor
	
	
############################ INITIALIZE ##################################
	
    def initialize(m,n)
	super
    end
    
############################ METODO [] #################################
    
    def [](i)
      @valor[i]
    end
    
########################## METODO [] ################################
    
    def []=(i,other)
      @valor[i] = other
    end
    
##################### METODO REPRESENTAR UNA CADENA ####################
    
    def to_s
      i=0
      cadena= ""
       while i<@fil
	    j=0
	    while j<@col
	      cadena+="#{valor[i][j]} "
	      j=j+1
	    end
	    
	  cadena+="\n "
	  i=i+1
	end
     cadena
    end 
     
     
######################## METODO SUMA DE MATRICES######################
    
    def +(other) 
      
      aux=Matriz.new(@col,@fil)
      i=0
      self.fil.times do |i|
	   j=0
	  self.col.times do |j|
	    aux[i][j]= valor[i][j] + other.get(i,j)
	    j=j+1
	  end
	i=i+1
	end
      aux
    end
    
############ METODO MULTIPLICAR UNA MATRIZ ###########
    
    
    def *(other)
      
      aux=Matriz.new(@col,@fil)
      i=0
      while i < @fil
	j = 0
	while j < other.col
	  k = 0
	  while k < @col
	    aux.valor[i][j] = aux.valor[i][j] + (self.get(i,k)*other.get(k,j))
	    k=k+1
	  end
	  j=j+1
	end
	i=i+1
      end
      aux
    end
    
    
############ METODO RESTA DE MATRICES ##################
    
    
    
    def -(other)
       aux=Matriz.new(@col,@fil)
      i=0
     
	self.fil.times do |i|
	   j=0
	  self.col.times do |j|
	    aux[i][j]= valor[i][j] - other.get(i,j)
	    j=j+1
	  end
	
	  i=i+1
	end
      aux
    end        
  
    
 ##################### METODO GET #########################
    
      def get(i,j)
	@valor[i][j]      
      end
      
############################## METODO MAXIMO DE UNA DENSA ##############################    
    def max
      max = @valor[0][0]
      i=0
	self.fil.times do |i|
	  j=0
	  self.col.times do |j|
	      if (@valor[i][j] > max)
		  max= @valor[i][j]
	      end
	      j=j+1
	  end
	i=i+1
      end
      max
    end
       
############################## METODO MINIMO DE UNA DENSA ################################      
   def min
       min = @valor[0][0]
       i = 0
       self.fil.times do |i|
            j = 0
            self.col.times do |j|
               if (@valor[i][j] < min)
                   min = @valor[i][j]
                end
                j=j+1
            end
           i=i+1
	end
      min
    end
     
################################# METODO ENCONTRAR #############################################
    
      def encontrar
	i=0
	self.fil.times do |i|
	  j=0
	  self.col.times do |j|
	    if (yield(@valor[i][j]))
	      return i,j
	    end
	  end
	  j=j+1
	end
	i=i+1
	return nil
      end
    
end
end
